function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for QQ. See: @timestepper/subsref.m 
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
  error(['Variable stepsize is not yet implemented in the QQ series' ...
	' methods']);
end;

% Input arguments:
vf = s.subs{1}; y = s.subs{2}; t = s.subs{3}; h = s.subs{4};

% Vector field information:
fm2g    = getfm2g(vf); eqntype = geteqntype(vf);
if ~strcmp(eqntype,'Linear'),
  error('The DE is not of Lie type!');
end;

% Timestepper information
meth  = getmethod(tso);
coord = getcoordinate(tso);
if ~strcmp(coord,'cay'),		% The coord. must be 'cay'.
  error('The coordinates must be cay.');
end;
  
Kj = zeros(liealgebra(getdomain(vf)),meth.RKns+1);

% Evaluate the function at appropriate points
for i = 1:meth.RKns
  Kj(i)=feval(fm2g,t + meth.RKc(i)*h,y);
end;

% Compute sigma - no general formula exists, so we must treat
%                 each method separately
if strcmp(meth.RKname,'qq4a')     % Order 4
  tmp=Kj(1)+Kj(2);
  tmp3=tmp;
  tmp3d=getdata(tmp)^3;
  if (isdata(tmp3,tmp3d)~=1)
    tt=project(tmp3,tmp3d);
    tt-tmp3d
    tmp3d=tt;
  end;
  setdata(tmp3,tmp3d);
  Kj(meth.RKns+1)=h/4*tmp-1/(8*sqrt(3))*h^2*[Kj(1),Kj(2)]-1/192*h^3*tmp3;
  Kj(meth.RKns+1)=2*Kj(meth.RKns+1);  %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
elseif strcmp(meth.RKname,'qq6a') % Order 6
  % Compute w_i
  w1=Kj(2);
  w2=(-sqrt(15)/3)/h*(Kj(1)-Kj(3));
  w3=(10/3)/(h^2)*(Kj(1)-2*Kj(2)+Kj(3));

  % Compute temporary variables
  w11=w1;
  w111=w1;
  tw12=w1;
  tw21=w1;

  w1d=getdata(w1);
  w2d=getdata(w2);
  w3d=getdata(w3);
  
  w11d=w1d^2;
  w111d=w11d*w1d;
  setdata(w111,w111d);

  tw12d=w1d*w2d;

  w12=[w1,w2];
  w23=[w2,w3];

  tt=w1;
  setdata(tt,w11d*w3d+w3d*w11d);
  
  w131=w1;
  setdata(w131,w1d*w3d*w1d);
  
  w11111=w1;
  setdata(w11111,w111d*w11d);

  tw12w1=w1;
  setdata(tw12w1,tw12d*w1d);
  
  % Compute sigma
  Kj(meth.RKns+1)=...
       h/2*w1 ...
      +h^3/24*(w3-w12-w111) ...
      +h^5*(1/480*(w23-[w2,w12]-tt+[tw12w1,w1]) ...
	    -1/160*w131+1/240*([w111,w2]+w11111));

  Kj(meth.RKns+1)=2*Kj(meth.RKns+1);  %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
else
  error('Do not know this QQ method.');
end;

% Evolve the solution
ylow = lambda(Kj(meth.RKns + 1),y,coord);

out.ylow=ylow;
out.errest=-1;

return;
