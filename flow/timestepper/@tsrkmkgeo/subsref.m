function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for RKMK. For more information see:
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

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Dec.
% LAST MODIFIED BY : Kenth Engø, 1999.03.09

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
vf = s.subs{1}; y  = s.subs{2}; t  = s.subs{3}; h  = s.subs{4};

% Vector field information:
fm2g    = getfm2g(vf); eqntype = geteqntype(vf);

% Timestepper information
meth  = getmethod(tso);
coord = getcoordinate(tso);

Kj = zeros(liealgebra(getdomain(vf)),meth.RKns);

%%%%%%%%%%%%%%%%%%
% Implicit methods
%%%%%%%%%%%%%%%%%%
if strcmp(meth.RKname,'GL4') | strcmp(meth.RKname,'GL6')

  TOLERENCE = 10^(-12);
  MAX_ITERATION = 15;
  Kj = zeros(feval(fm2g,t,y),meth.RKns);
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;
  THETA_NEW = Kj(1);
  THETA_OLD = Kj(1);

  while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
    for j = 1:meth.RKns,		
      YS = lambda(-THETA_NEW,y,coord);
      U = THETA_NEW + Kj(1:meth.RKns)*meth.RKa(j,1:meth.RKns);
      K = h*feval(fm2g,t+h*meth.RKc(j),lambda(U,YS,coord));
      Kj(j) = feval(['d' coord 'inv'],U,K,meth.RKord);
    end;
    THETA_OLD = THETA_NEW;
    THETA_NEW = (-0.5)*(Kj*meth.RKb);
    ITER_DIST = dist(THETA_NEW,THETA_OLD);
    ITERATION = ITERATION + 1;
  end;

  if (ITERATION == MAX_ITERATION),
    warning('MAX_ITERATION was reached.');
  end;

else
  error(['The method ' meth.RKname ' is not available for this time stepper']);
end;

Ulow = Kj*meth.RKb;
ylow = lambda(Ulow,y,coord);
out.ylow = ylow;
out.errest = -1;

if DMVARSTEP,
  if sum(meth.RKbhat)==0,
    error([' ==> ' meth.RKname ...
	  ' does not support variable stepsize. Update setmethod.m']);
  end;
  Uhigh = Kj*(h*meth.RKbhat);
  yhigh = lambda(Uhigh,y,coord);
  errest = dist(Ulow,Uhigh);
  out.yhigh = yhigh;
  out.errest = errest;
end;

return;
