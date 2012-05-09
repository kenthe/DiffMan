function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for SYM. For more information see:
%      @timestepper/subsref.m
%
% CALLED AS:  out = tsobj(vf,y,t,h);
%        where
%             out.ylow=ylow;     (low order approximatio)
%             out.yhigh=yhigh;   (high order approximation)
%             out.errest=errest; (error estimate)
%        when using variable stepsize, and
%             out.ylow=ylow;     (low order approximation)
%             out.errest=-1;     (error estimate)
%           when using constant stepsize
% WRITTEN BY       : KE, Jan. 1999.
% LAST MODIFIED BY : KE, Feb. 1999.

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
vf = s.subs{1};
y  = s.subs{2};
t  = s.subs{3};
h  = s.subs{4};
fm2g = getfm2g(vf);
eqntype = geteqntype(vf);
meth  = getmethod(tso);
coord = getcoordinate(tso);
Kj = zeros(liealgebra(getdomain(vf)),meth.RKns);
TOLERENCE = 1.0e-14;
MAX_ITERATION = 20;
if strcmp(meth.RKname,'GL6S');
  K0 = h*feval(fm2g,t,y);
  for i=1:meth.RKns,
    X(i) = lambda(meth.RKc(i)*K0,y,coord);
    Kj(i)= h*feval(fm2g,t+h*meth.RKc(i),X(i));
  end;
  Kj_Tilde = Kj;
  SIGMA = 0.5*K0;
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;
  while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
    SU = meth.RKa(2,:)*Kj_Tilde;
    U1 = Kj_Tilde(1:meth.RKns)*meth.RKa(1,1:meth.RKns) - SU;
    U3 = Kj_Tilde(1:meth.RKns)*meth.RKa(3,1:meth.RKns) - SU;
    XS = lambda(SU,y,coord);
    X(1) = lambda(U1,XS,coord);
    X(3) = lambda(U3,XS,coord);
    Kj(1) = h*feval(fm2g,t+h*meth.RKc(1),X(1));
    Kj_Tilde(1) = dexpinvtest(U1,Kj(1),meth.RKord);
    Kj(2) = h*feval(fm2g,t+h*meth.RKc(2),XS);
    Kj_Tilde(2) = Kj(2);
    Kj(3) = h*feval(fm2g,t+h*meth.RKc(3),X(3));
    Kj_Tilde(3) = dexpinvtest(U3,Kj(3),meth.RKord);
    SIGMA_OLD = SIGMA;
    SIGMA = meth.RKb*Kj_Tilde - SU;
    ITER_DIST = dist(SIGMA_OLD,SIGMA)/norm(SIGMA);
    ITERATION = ITERATION + 1;
  end;
  if (ITERATION == MAX_ITERATION),
    warning('MAX_ITERATION was reached.');
  end;
  ylow = lambda(SIGMA,XS,coord);
  out.ylow = ylow;
  out.errest = -1;
  if DMVARSTEP,
    if (sum(meth.RKbhat) == 0),
      error([' ==> ' meth.RKname ' does not support variable stepsize. Update' ...
	      ' setmethod.m!']);
    end;
    Uhigh = Kj_Tilde*meth.RKbhat;
    yhigh = lambda(Uhigh,XS,coord);
    errest = dist(SIGMA,Uhigh);
    out.yhigh = yhigh;
    out.errest = errest;
  end;
elseif strcmp(meth.RKname,'GL4S');
  U0=y;
  X1 = y;
  Sigma1 = feval(fm2g,t+h*meth.RKc(1),X1);
  Gamma1 = Sigma1;
  F1 = dexpinv(Sigma1,Gamma1,meth.RKord);
  X2 = y;
  Sigma2 = feval(fm2g,t+h*meth.RKc(2),X2);
  Gamma2 = Sigma2;
  F2 = dexpinv(Sigma2,Gamma2,meth.RKord);
  Sigma_half = h*((1/3 + sqrt(3)/8)*F1 + (1/6-sqrt(3)/8)*F2);
  U_half = lambda(Sigma_half,U0,coord);
  ITERATION = 0;
  ITER_DIST = TOLERENCE + 1;
  while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
    Sigma11 = h*(meth.RKa(1,1)*F1 + meth.RKa(1,2)*F2);
    X11 = lambda((Sigma11-Sigma_half),U_half,coord);
    Gamma11 = feval(fm2g,t+h*meth.RKc(1),X11);
    F11 = dexpinv(Sigma11-Sigma_half,Gamma11,meth.RKord);
    Sigma22 = h*(meth.RKa(2,1)*F1 + meth.RKa(2,2)*F2);
    X22 = lambda((Sigma22-Sigma_half),U_half,coord);
    Gamma22 = feval(fm2g,t+h*meth.RKc(2),X22);
    F22 = dexpinv(Sigma22-Sigma_half,Gamma22,meth.RKord);
    ITER_DIST = ...
	max(norm(Sigma1-Sigma11)/norm(Sigma1),norm(Sigma2-Sigma22)/norm(Sigma2));
    Sigma1 = Sigma11;
    F1 = F11;
    Sigma2 = Sigma22;
    F2 = F22;
    Sigma_half = h*((1/3 + sqrt(3)/8)*F1 + (1/6-sqrt(3)/8)*F2);
    U_half = lambda(Sigma_half,U0,coord);
  end;
  if (ITERATION == MAX_ITERATION),
    warning('MAX_ITERATION was reached.');
  end;
  %ylow = lambda(SIGMA,XS,coord);
  ylow = lambda(Sigma1,U_half,coord);
  out.ylow = ylow;
  out.errest = -1;
  if DMVARSTEP,
    if (sum(meth.RKbhat) == 0),
      error([' ==> ' meth.RKname ' does not support variable stepsize. Update setmethod.m!']);
    end;
    Uhigh = Kj_Tilde*meth.RKbhat;
    yhigh = lambda(Uhigh,XS,coord);
    errest = dist(SIGMA,Uhigh);
    out.yhigh = yhigh;
    out.errest = errest;
  end;
else
  error(['The method ' meth.RKname ' is not available for this timestepper.']);
end;

return;
