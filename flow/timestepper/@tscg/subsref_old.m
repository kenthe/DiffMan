function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for CG. See: @timestepper/subsref.m 
% function [out] = subsref(tso,s)
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
% LAST MODIFIED BY : Kenth Engø, 2000.03.07

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
  if strcmp(eqntype,'Linear'),
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
%  error(['Fully implicit integrator is not implemented yet.']);

  TOLERENCE = 10^(-14);
  %TOLERENCE=max([1.0e-12,0.01*h^(meth.RKord)]);
  MAX_ITERATION = 150;
  Kj_NEW = zeros(feval(fm2g,t,y),meth.RKns);
  Kj_OLD = Kj_NEW;      % This is the initial value of the iteration.
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;

  while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
    for i = 1:meth.RKns,		
      Yr(i) = y;
      for j = 1:meth.RKns,
        Yr(i) = lambda(h*meth.RKa(i,j)*Kj_OLD(j),Yr(i),coord);
      end;
      Kj_NEW(i) = feval(fm2g,t + meth.RKc(i)*h,Yr(i));        
    end;
    ITER_DIST = dist(Kj_NEW,Kj_OLD);
    ITERATION = ITERATION + 1;
    Kj_OLD = Kj_NEW;
  end;
  Kj = Kj_NEW;

  ITERATION
  t

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
