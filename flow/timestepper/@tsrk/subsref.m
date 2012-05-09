function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for RK. See: @timestepper/subsref.m 
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

% WRITTEN BY       : Kenth Engø, 1998.06.05
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
fm2g    = getfm2g(vf); eqntype = geteqntype(vf);

% Timestepper information
meth  = getmethod(tso);
coord = getcoordinate(tso);

Kj = zeros(liealgebra(getdomain(vf)),meth.RKns);
Yr = zeros(y,meth.RKns);

if strcmp(meth.RKtype,'explicit'),
  if strcmp(eqntype,'Linear'),          % Case: Linear or Lie type equation.
    for i = 1:meth.RKns,		% Runs over all steps of the method.
      Kj(i)=feval(fm2g,t + meth.RKc(i)*h,y);
    end;
  else					% Integration of general rhs.
    for i=1:meth.RKns
      Yr(i) = y;
      if (i > 1),
	for j = 1:i-1
	  Yr(i) = lambda(h*meth.RKa(i,j)*Kj(j),Yr(i),coord);
	end;
      end;
      Kj(i)=feval(fm2g,t + meth.RKc(i)*h,Yr(i));
    end;
  end;
elseif strcmp(meth.RKtype,'implicit')
  error(['Fully implicit integrator is not implemented yet.']);
elseif strcmp(meth.RKtype,'SDIRK'),
  error(['Integrator based on SDIRK methods is not implemented yet.']);
else
  error(['The method ' meth.RKtype ' is not available']);
end;

% Evolve the solution
ylow=y;
for i=1:meth.RKns
  ylow=lambda(h*meth.RKb(i)*Kj(i),ylow,coord);
end
out.ylow = ylow;
out.errest = -1;

if DMVARSTEP,
  if sum(meth.RKbhat)==0,
    error([' ==> ' meth.RKname ...
	  ' does not support variable stepsize. Update setmethod.m']);
  end;
  yhigh=y;
  for i=1:meth.RKns
    yhigh=lambda(h*meth.RKbhat(i)*Kj(i),yhigh,coord);
  end
  out.yhigh = yhigh;
  % Should error estimation be done here? Perhaps later?
  errest = dist(ylow,yhigh);
  out.errest = errest;
end;

return;
