function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for RKMK. See: @timestepper/subsref.m 
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

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Dec.
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

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
fm2g = getfm2g(vf); eqntype = geteqntype(vf);

% Timestepper information
meth  = getmethod(tso);
coord = getcoordinate(tso);

Kj = zeros(liealgebra(getdomain(vf)),meth.RKns);

%%%%%%%%%%%%%%%%%%
% Explicit methods
%%%%%%%%%%%%%%%%%%
if strcmp(meth.RKtype,'explicit'),

  Kj(1) = feval(fm2g,t,y);
  if strcmp(eqntype,'Linear'),          % Case: Linear or Lie type equation.
    for j = 2:meth.RKns,		% Runs over all steps of the method.
      U = Kj(1:j-1)*(h*meth.RKa(j,1:j-1));
      K = feval(fm2g,t+h*meth.RKc(j),y);
      Kj(j) = feval(['d' coord 'inv'],U,K,meth.RKord-1);
    end;
  else					% Integration in case of general rhs.
    for j = 2:meth.RKns,
      U = Kj(1:j-1)*(h*meth.RKa(j,1:j-1));
      p = lambda(U,y,coord); 
      K = feval(fm2g,t+h*meth.RKc(j),p);
      Kj(j) = feval(['d' coord 'inv'],U,K,meth.RKord-1);
    end;
  end;

%%%%%%%%%%%%%%%%%%
% Implicit methods
%%%%%%%%%%%%%%%%%%
elseif strcmp(meth.RKtype,'implicit')

  % The variables controlling the solution of the 
  % nonlinear system, the user should be able to change.

  TOLERENCE = 10^(-15);
  %TOLERENCE=max([1.0e-12,0.01*h^(meth.RKord)]);
  MAX_ITERATION = 50;
  Kj_NEW = zeros(feval(fm2g,t,y),meth.RKns);
  Kj_OLD = Kj_NEW;      % This is the initial value of the iteration.
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;

  if strcmp(eqntype,'Linear'),
    while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
      for j = 1:meth.RKns,		
	U = Kj_OLD(1:meth.RKns)*(h*meth.RKa(j,1:meth.RKns));
	  K = feval(fm2g,t+h*meth.RKc(j),y);
	  Kj_NEW(j) = feval(['d' coord 'inv'],U,K,meth.RKord-1);
      end;
      ITER_DIST = dist(Kj_NEW,Kj_OLD);
      TERATION = ITERATION + 1;
      Kj_OLD = Kj_NEW;
    end;
  else					% Case of general equation.
    while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
      for j = 1:meth.RKns,		
	U = Kj_OLD(1:meth.RKns)*(h*meth.RKa(j,1:meth.RKns));
	  K = feval(fm2g,t+h*meth.RKc(j),lambda(U,y,coord));
	  Kj_NEW(j) = feval(['d' coord 'inv'],U,K,meth.RKord-1);
      end;
      ITER_DIST = dist(Kj_NEW,Kj_OLD);
      ITERATION = ITERATION + 1;
      Kj_OLD = Kj_NEW;
    end;
  end;
  Kj = Kj_NEW;

%%%%%%%%%%%%%%%
% SDIRK methods
%%%%%%%%%%%%%%%      
elseif strcmp(meth.RKtype,'SDIRK'),
  error(['Integrator based on SDIRK methods is not implemented yet.']);
else
  error(['The method ' meth.RKtype ' is not available']);
end;

Ulow = Kj*(h*meth.RKb);
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
