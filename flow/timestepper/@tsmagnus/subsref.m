function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for MAGNUS. See: @timestepper/subsref.m 
% function [out] = subsref(tso,s)
%
% CALLED AS:  out = tsobj(vf,y,t,h);
%           where
%             out.ylow=ylow;     (low order approximation)
%             out.errest=-1;     (error estimate)
%           when using constant stepsize
%
% WRITTEN BY       : Kenth Engø, 1998.06.07
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

if DMVARSTEP,
  error(['Variable stepsize is not yet implemented in the Magnus series' ...
	' methods']);
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

% Default values necessary for the implicit methods
defaults=getdefaults(evalin('caller','f'));

if strcmp(eqntype,'Linear'),
  Kj = zeros(liealgebra(getdomain(vf)),meth.RKns+1);

  % Evaluate the function at appropriate points
  for i = 1:meth.RKns
    Kj(i)=feval(fm2g,t + meth.RKc(i)*h,y);
  end;

  % Compute sigma - no general formula exists, so we must treat
  %                 each method separately
  if strcmp(meth.RKname,'M4a')     % Order 4, Lie type
    Kj(meth.RKns + 1) = h/2*(Kj(1)+Kj(2))+sqrt(3)/12*h^2*[Kj(2),Kj(1)];
  elseif strcmp(meth.RKname,'M6a') % Order 6, Lie type
    % Initialize a proper array.
    Cj = zeros(Kj(1),7);
    % Compute brackets
    Cj(1) = [Kj(1),Kj(2)];
    Cj(2) = [Kj(1),Kj(3)];
    Cj(3) = [Kj(2),Kj(3)];
    % Compute more temporary variables
    Cj(4) = h/18.0*(5*Kj(1) + 8*Kj(2) + 5*Kj(3));
    Cj(5) = -sqrt(15)/108.0*h^2*(2*Cj(1) + Cj(2) + 2*Cj(3));
    Cj(6) = h^3/432.0*([Kj(1) - 5*Kj(3),Cj(1)] + [5*Kj(1) - Kj(3),Cj(3)]);
    Cj(7) = sqrt(15)/2160.0*h^4*[Kj(1),[Kj(3),Cj(2)]];
    % Compute sigma
    Kj(meth.RKns + 1) = Cj(4) + Cj(5) + Cj(6) + Cj(7);
  else
    error('Do not know this Magnus series method for Lie type problems.');
  end;

  % Evolve the solution
  ylow = lambda(Kj(meth.RKns + 1),y,coord);
else
  if strcmp(meth.RKname,'MRC3') % Magnus expansion with relaxed
                                % collocation of order 3
    A=zeros(liealgebra(getdomain(vf)),3);
    Y=y;
    A(1)=feval(fm2g,t,Y);
    Y=lambda(h/2*A(1),y,coord);
    A(2)=feval(fm2g,t+h/2,Y);
    Y=lambda(h*(-A(1)+2*A(2)),y,coord);
    A(3)=feval(fm2g,t+h,Y);

    ylow=lambda(h*(1/6*A(1)+2/3*A(2)+1/6*A(3))...
	-h^2/2*[A(1)-A(3),2/15*A(2)+1/30*A(3)],y,coord);
  elseif strcmp(meth.RKname,'MC4') % Magnus expansion with collocation of
                                   % order 4
    % Use either fixed point or Newton iteration

    % for the time being we just implement fixed point iteration -
    % this will be changed in a future release of DiffMan
    A=zeros(liealgebra(getdomain(vf)),2);

    % initialize
    Y1=y;
    Y2=y;
    itdist=1.0;
    count=0;
    maxit=50;
    tol=max([1.0e-12,0.01*h^(meth.RKord)]);

    s36=sqrt(3)/6;
    k1=0.25-s36;
    k2=0.25+s36;
    k3=5/72+s36/4;
    k4=5/72-s36/4;

    % iterate
    while ((itdist>tol)&(count<maxit))
      %ynew=feval(itfunc,inobj,y);
      
      A(1)=feval(fm2g,t+meth.RKc(1)*h,Y1);
      A(2)=feval(fm2g,t+meth.RKc(2)*h,Y2);

      A12=[A(1),A(2)];
      Ynew1=lambda(h*(0.25*A(1)+k1*A(2))+k4*h^2*A12,y,coord);
      Ynew2=lambda(h*(k2*A(1)+0.25*A(2))+k3*h^2*A12,y,coord);

      itdist=max([dist(Ynew1,Y1),dist(Ynew2,Y2)]);
      
      Y1=Ynew1;
      Y2=Ynew2;
      count=count+1;
    end

    % check if we converged
    if count==maxit,
      disp(['Warning: maximum number of iterations (' num2str(maxit)...
	    ') reached without convergence:']);
      disp(['            tol=' num2str(tol) ' and err=' num2str(itdist)]);
    end;

    % advance the solution
    ylow=lambda(h/2*(A(1)+A(2))-sqrt(3)/12*h^2*A12,y,coord);
  else
    error('Do not know this Magnus series method for general problems');
  end
end;

out.ylow=ylow;
out.errest=-1;

return;
