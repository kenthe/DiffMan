function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for CG. For more information see:
%           @timestepper/subsref.m 
%
% CALLED AS:  out = tsobj(vf,y,t,h);
%           where
%             out.ylow=ylow;     (low order approximation)
%             out.yhigh=yhigh;   (high order approximation)
%             out.errest=errest; (error estimate)
%           when using variable stepsize, and
%             out.ylow=ylow;     (low order approximation)
%             out.errest=-1;     (error estimate)
%           when using constant stepsize

% WRITTEN BY       : Kenth Engø, 1998.06.07
% LAST MODIFIED BY : Arne Marthinsen, 1998.09.29

global DMARGCHK DMVARSTEP

n = length(s.subs);
if DMARGCHK
  if ((n ~= 4)|(nargout > 1)),
    error('Wrong number of input/output arguments!');
  end;
  if ~isa(s.subs{1},'vectorfield'),
    error('First argument is no vectorfield object');
  end;
  if ~isa(s.subs{2},'hmanifold'),
    error('First argument is no manifold object');
  end;
  if ~isreal([s.subs{3} s.subs{4}]),
    error('Non-scalar argument as input number 3 and/or 4');
  end;
end;

% Input arguments:
vf = s.subs{1}; y = s.subs{2}; t = s.subs{3}; h = s.subs{4};

% Vector field information:
fm2g    = getfm2g(vf); eqntype = geteqntype(vf);

% Timestepper information
meth  = getmethod(tso);
coord = getcoordinate(tso);
if ~strcmp(coord,'exp'),		% The coord. must be 'exp'.
  error('The coordinates must be exp.');
end;

Kj = zeros(liealgebra(getdomain(vf)),meth.RKns);
Yr = zeros(y,meth.RKns);

if strcmp(meth.RKtype,'explicit')
  % Integration in case of linear or Lie type equation
  if (eqntype == 'L')|(eqntype == 'l'),
    for i = 1:meth.RKns,
      Kj(i) = feval(fm2g,t + meth.RKc(i)*h,y);
    end;
  else,					% Integration of general rhs
    for i = 1:meth.RKns,
      Yr(i) = y;
      if i > 1,
	for j = 1:i-1,
	  Yr(i) = lambda(h*meth.RKa(i,j)*Kj(j),Yr(i),coord);
	end;
      end;
      Kj(i) = feval(fm2g,t + meth.RKc(i)*h,Yr(i));
    end;
  end;
elseif strcmp(meth.RKtype,'implicit')
  if strcmp(meth.RKname,'CG4test')
    TOLERENCE = 10^(-8);
    MAX_ITERATION = 150;
    Kj_NEW = zeros(feval(fm2g,t,y),meth.RKns);
    Kj_OLD = Kj_NEW;      % This is the initial value of the iteration.
    ITERATION = 0;
    ITER_DIST = TOLERENCE + 1;
    
    %Compute stages 1, 2 and 3:
    Yr(1)=y;
    Kj_NEW(1)=feval(fm2g,t+meth.RKc(1)*h,Yr(1));
    Yr(2)=lambda(h*meth.RKa(2,1)*Kj_NEW(1),y,coord);
    Kj_NEW(2)=feval(fm2g,t+meth.RKc(2)*h,Yr(2));
    Yr(3)=lambda(h*meth.RKa(3,2)*Kj_NEW(2),lambda(h*meth.RKa(3,1)*Kj_NEW(1),y,coord),coord);
    Kj_NEW(3)=feval(fm2g,t+meth.RKc(3)*h,Yr(3));

    Kj_OLD(1)=Kj_NEW(1);
    Kj_OLD(2)=Kj_NEW(2);
    Kj_OLD(3)=Kj_NEW(3);

    sprod=y;
    for j=1:3
      sprod=lambda(h*meth.RKa(4,j)*Kj_OLD(j),sprod,coord);
    end;

    if (eqntype == 'L')|(eqntype == 'l'), % Case: Linear or Lie type equation.
      error(['Fully implicit integrator is not implemented yet: L+sCG3a']);
    else					% Case of general equation.
      while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
	%for i=4:6
	%  Yr(i)=y;
	%  for j=1:meth.RKns
	%    Yr(i)=lambda(h*meth.RKa(i,j)*Kj_OLD(j),Yr(i),coord);
	%  end;
	%  Kj_NEW(i)=feval(fm2g,t+meth.RKc(i)*h,Yr(i));
	%end;
	
	%Optimized (I hope...)
	Yr(4)=sprod;
	for j=4:5
	  Yr(4)=lambda(h*meth.RKa(4,j)*Kj_OLD(j),Yr(4),coord);
	end;
	Yr(5)=Yr(4);
	Yr(6)=Yr(4);
	Yr(4)=lambda(h*meth.RKa(4,6)*Kj_OLD(6),Yr(4),coord);
	Yr(4)=lambda(h*meth.RKa(4,7)*Kj_OLD(7),Yr(4),coord);
	Yr(5)=lambda(h*meth.RKa(5,6)*Kj_OLD(6),Yr(5),coord);
	Yr(6)=lambda(h*meth.RKa(6,6)*Kj_OLD(6),Yr(6),coord);

	Kj_NEW(4)=feval(fm2g,t+meth.RKc(4)*h,Yr(4));
	Kj_NEW(5)=feval(fm2g,t+meth.RKc(5)*h,Yr(5));
	Kj_NEW(6)=feval(fm2g,t+meth.RKc(6)*h,Yr(6));

	Kj_NEW(7)=Kj_NEW(5);
	Kj_NEW(8)=Kj_NEW(4);
	ITER_DIST = dist(Kj_NEW,Kj_OLD);
	ITERATION = ITERATION + 1;
	Kj_OLD = Kj_NEW;
      end;
    end;
    Kj=Kj_NEW;

    %t
    %ITERATION

  else
    TOLERENCE = 10^(-15);
    MAX_ITERATION = 100;
    Kj_NEW = zeros(feval(fm2g,t,y),meth.RKns);
    Kj_OLD = Kj_NEW;      % This is the initial value of the iteration.
    ITERATION = 0;
    ITER_DIST = TOLERENCE + 1;
    
    if (eqntype == 'L')|(eqntype == 'l'), % Case: Linear or Lie type equation.
      error(['Fully implicit integrator is not implemented yet: L']);
    else					% Case of general equation.
      while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
	for i=1:meth.RKns
	  Yr(i)=y;
	  for j=1:meth.RKns
	    Yr(i)=lambda(h*meth.RKa(i,j)*Kj_OLD(j),Yr(i),coord);
	  end;
	  Kj_NEW(i)=feval(fm2g,t+meth.RKc(i)*h,Yr(i));
	end;
	ITER_DIST = dist(Kj_NEW,Kj_OLD);
	ITERATION = ITERATION + 1;
	Kj_OLD = Kj_NEW;
      end;
    end;
    Kj=Kj_NEW;
  end;
elseif strcmp(meth.RKtype,'SDIRK'),
  error(['Integrator based on SDIRK methods is not implemented yet.']);
else
  error(['The method ' meth.RKtype ' is not available']);
end;

% Evolve the solution:
ylow=y;
for i = 1:meth.RKns,
  ylow = lambda(h*meth.RKb(i)*Kj(i),ylow,coord);
end;
out.ylow = ylow;
out.errest = -1;

if DMVARSTEP,
  if sum(meth.RKbhat)==0,
    error([' ==> ' meth.RKname ...
	  ' does not support variable stepsize. Update setmethod.m']);
  end;
  yhigh=y;
  for i=1:meth.RKns,
    yhigh=lambda(h*meth.RKbhat(i)*Kj(i),yhigh,coord);
  end;
  out.yhigh = yhigh;
end;

return;
