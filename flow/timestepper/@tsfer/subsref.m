function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for FER. See: @timestepper/subsref.m
% function [out] = subsref(tso,s)

% WRITTEN BY       : Arne Marthinsen, October 1998
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
  error(['Variable stepsize is not yet implemented in the fer methods']);
end;

% Input arguments:
vf = s.subs{1}; y = s.subs{2}; t = s.subs{3}; h = s.subs{4};

% Vector field information:
fm2g = getfm2g(vf); eqntype = geteqntype(vf);

% Timestepper information
meth  = getmethod(tso);
coord = getcoordinate(tso);
if ~strcmp(coord,'exp'),		% The coord. must be 'exp'.
  error('The coordinates must be exp.');
end;

if strcmp(eqntype,'Linear'),
  Kj=zeros(liealgebra(getdomain(vf)),length(meth.RKc));
  B=zeros(liealgebra(getdomain(vf)),meth.RKns);

  % Compute B_i, i=0,...,m - implementation according to
  %                          Iserles: Solving Linear Ordinary Differential
  %                              Equations by Exponentials of Iterated
  %                              Commutators.
  %                              Numer. Math. 45, 183-199 (1984)
  if(meth.RKns<1),
    error('Nothing to do!');
  end;
  if(meth.RKns>0),
    if((length(meth.RKc)~=sum(meth.RKa))|(length(meth.RKc)~=length(meth.RKb))),
      error('Inconsistent information in the method coefficients');
    end;
    % Compute B0:
    for i=1:meth.RKa(1)
      Kj(i)=feval(fm2g,t+meth.RKc(i)*h,y);
    end;
    for j=1:meth.RKa(1)
      B(1)=B(1)+h*meth.RKb(j)*Kj(j);
    end;
  end;
  if(meth.RKns>1),
    % Construct B(1):
    A=zeros(liealgebra(getdomain(vf)),meth.RKa(2));
    B0=zeros(liealgebra(getdomain(vf)),meth.RKa(2));
    C=zeros(liealgebra(getdomain(vf)),meth.RKa(2)*meth.RKord);
      
    for i=1:meth.RKa(1)
      Kj(i)=feval(fm2g,t+meth.RKc(meth.RKa(1)+1)*meth.RKc(i)*h,y);
    end;
    for i=1:meth.RKa(1)
      B0(1)=B0(1)+meth.RKb(i)*Kj(i);
    end;
    B0(1)=meth.RKc(meth.RKa(1)+1)*h*B0(1);
    for i=2:meth.RKa(2)
      Kj=zeros(liealgebra(getdomain(vf)),2);
      for j=1:meth.RKa(1)
	Kj(1)=feval(fm2g,t+(meth.RKc(meth.RKa(1)+i-1)+...
	    (meth.RKc(meth.RKa(1)+i)-meth.RKc(meth.RKa(1)+i-1))*...
	     meth.RKc(j))*h,y);
	Kj(2)=Kj(2)+meth.RKb(j)*Kj(1);
      end;
      B0(i)=B0(i-1)+(meth.RKc(meth.RKa(1)+i)...
	    -meth.RKc(meth.RKa(1)+i-1))*h*Kj(2);
    end;
    for i=1:meth.RKa(2)
      C(i)=feval(fm2g,t+meth.RKc(meth.RKa(1)+i)*h,y);
    end;
    for i=1:meth.RKa(2)
      for j=2:meth.RKord
	C((j-1)*meth.RKa(2)+i)=[C((j-2)*meth.RKa(2)+i),B0(i)];
      end;
    end;
    for i=1:meth.RKa(2)
      jp1fac=1;
      for j=2:meth.RKord
        jp1fac=jp1fac*j;
        A(i)=A(i)+(j-1)/jp1fac*C((j-1)*meth.RKa(2)+i);
      end;
    end;
    for j=1:meth.RKa(2)
      B(2)=B(2)+h*meth.RKb(meth.RKa(1)+j)*A(j);
    end;
  end;
  if(meth.RKns>2),
    error(['Fer methods with more than two stages are not' ...
          ' implemented in DiffMan (Lie type problems).']);
  end;
    
  % Evolve the solution
  for j=1:meth.RKns
    y=lambda(B(meth.RKns-j+1),y,coord);
  end;
else
  % Collocation type methods
  % No general formula exists, so we must treat each method separately
  if strcmp(meth.RKname,'FRC3')    % Fer expansion with relaxed collocation
                                   % of order 3
    A=zeros(liealgebra(getdomain(vf)),3);
    Y=y;
    A(1)=feval(fm2g,t,Y);
    Y=lambda(h/2*A(1),y,coord);
    A(2)=feval(fm2g,t+h/2,Y);
    Y=lambda(h*(-A(1)+2*A(2)),y,coord);
    A(3)=feval(fm2g,t+h,Y);

    y=lambda(-h^2/2*[A(1)-A(3),2/15*A(2)+1/30*A(3)],y,coord);
    y=lambda(h*(1/6*A(1)+2/3*A(2)+1/6*A(3)),y,coord);

  elseif strcmp(meth.RKname,'FC4') % Fer expansion with collocation of
                                   % order 4
    % Use either fixed point or Newton iteration

    % for the time being we just implement fixed point iteration -
    % this will be changed in a future release of DiffMan
    A=zeros(liealgebra(getdomain(vf)),3);

    % initialize
    Y1=y;
    Y2=y;
    Y3=y;
    itdist=1.0;
    count=0;
    maxit=50;
    tol=max([1.0e-12,0.01*h^(meth.RKord)]);

    % iterate
    while ((itdist>tol)&(count<maxit))
      %ynew=feval(itfunc,inobj,y);
      
      A(1)=feval(fm2g,t+meth.RKc(1)*h,Y1);
      A(2)=feval(fm2g,t+meth.RKc(2)*h,Y2);
      A(3)=feval(fm2g,t+meth.RKc(3)*h,Y3);

      A12=[A(1),A(2)];
      A13=[A(1),A(3)];
      A23=[A(2),A(3)];

      Ynew1=y;

      K1=5/24*A(1)+1/3*A(2)-1/24*A(3);
      K2=-11/240*A12+1/240*A13-1/240*A23;
      Ynew2=lambda(h*K1,lambda(h^2/2*K2,y,coord),coord);

      K1=1/6*A(1)+2/3*A(2)+1/6*A(3);
      K2=-2/15*A12-1/30*A13-2/15*A23;
      Ynew3=lambda(h*K1,lambda(h^2/2*K2,y,coord),coord);

      itdist=max([dist(Ynew1,Y1),dist(Ynew2,Y2),dist(Ynew3,Y3)]);
      
      Y1=Ynew1;
      Y2=Ynew2;
      Y3=Ynew3;
      count=count+1;
    end

    % check if we converged
    if count==maxit,
      disp(['Warning: maximum number of iterations (' num2str(maxit)...
	    ') reached without convergence:']);
      disp(['            tol=' num2str(tol) ' and err=' num2str(itdist)]);
    end;

    % Advance the solution
    Y1=h*(1/6*A(1)+2/3*A(2)+1/6*A(3));

    K12=[A(1),A(2)];
    K13=[A(1),A(3)];
    K23=[A(2),A(3)];

    Y2=h^2/2*(-2/15*K12-1/30*K13-2/15*K23);

    YY1=-8/315*A(1)-17/315*A(2)-17/5670*A(3);
    YY2=-1/168*A(1)-1/45*A(2)+13/5670*A(3);
    YY3=-1/42*A(1)-5/63*A(2)-1/126*A(3);
    K1=[K12,YY1];
    K2=[K13,YY2];
    K3=[K23,YY3];

    Y3=h^3/3*(K1+K2+K3);

    y=lambda(Y1,lambda(Y2+Y3,y,coord),coord);
  else
    error('Do not know this Fer expansion method (general problems)');
  end;
end;

out.ylow=y;
out.errest=-1;

return;
