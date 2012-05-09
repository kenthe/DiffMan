function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for SCG. See: @timestepper/subsref.m 
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

% WRITTEN BY       : KE & AM, 1999.08.19
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

% % Integration in case of linear or Lie type equation
%  if strcmp(eqntype,'Linear'),
%    for i = 1:meth.RKns,
%      Kj(i) = feval(fm2g,t + meth.RKc(i)*h,y);
%    end;
%  else,					% Integration of general rhs

%    h = h/2;
%    for i = 1:meth.RKns,
%      Yr(i) = y;
%      if i > 1,
%	for j = 1:i-1,
%	  Yr(i) = lambda(h*meth.RKa(i,j)*Kj(j),Yr(i),coord);
%	end;
%      end;
%      Kj(i) = feval(fm2g,t + meth.RKc(i)*h,Yr(i));
%    end;
%    yhalf = y;
%    for i = 1:meth.RKns,
%      yhalf = lambda(h*meth.RKb(i)*Kj(i),yhalf,coord);
%    end;

  TOLERENCE = 10^(-14);
  %TOLERENCE=max([1.0e-12,0.01*h^(meth.RKord)]);
  MAX_ITERATION = 150;
  Kj_NEW = zeros(feval(fm2g,t,y),meth.RKns);
  Kj_OLD = Kj_NEW;      % This is the initial value of the iteration.
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;

  h=h/2;

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
  yhalf = y;
  for i = 1:meth.RKns,
    yhalf = lambda(h*meth.RKb(i)*Kj(i),yhalf,coord);
  end;


% The following are the coefficients of the (2s-1) stage adjoint method:
  
  s = meth.RKns;
  RKns = 2*s-1;
  RKb = zeros(1,RKns);
  RKb(1:s) = meth.RKb(s:-1:1);
  RKa = zeros(RKns);  
  RKa(:,1:s-1)   = kron(ones(RKns,1),RKb(1:s-1));
  RKa(:,s)       = meth.RKb(1) - [meth.RKa(s:-1:1,1); meth.RKa(2:s,1)]; 
  RKa(:,s+1:end) = - [meth.RKa(s:-1:1,2:s); meth.RKa(2:s,2:s)]; 
  RKc = zeros(1,RKns);
  RKc(s:(RKns)) = 1 - meth.RKc;
  RKc(1:s-1) = RKc(RKns:-1:s+1);
  
  TOLERENCE = 10^(-14);
  MAX_ITERATION = 150;
  Kj_NEW = zeros(feval(fm2g,t,y),RKns);
  Kj_OLD = Kj_NEW;      % This is the initial value of the iteration.
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;

    while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
      for i = 1:RKns,		
	Yr(i) = yhalf;
        for j = 1:RKns,
          Yr(i) = lambda(h*RKa(i,j)*Kj_OLD(j),Yr(i),coord);
        end;
        Kj_NEW(i) = feval(fm2g,t + RKc(i)*h,Yr(i));        
      end;
      ITER_DIST = dist(Kj_NEW,Kj_OLD);
      ITERATION = ITERATION + 1;
      Kj_OLD = Kj_NEW;
    end;

  Kj = Kj_NEW;

% Evolve the solution:
ylow=yhalf;
for i = 1:RKns,
  ylow = lambda(h*RKb(i)*Kj(i),ylow,coord);
end;
out.ylow = ylow;
out.errest = -1;

return;
