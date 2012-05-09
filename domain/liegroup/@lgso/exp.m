function [v] = exp(lgr,a)
% EXP - Computes the exponential from LASO to LGSO.
% function [v] = exp(lgr,a)
%
% REMARK: For the case where the shape equals 3, this routine
%         uses, if 'dmoptimized on', the Euler-Rodrigues' formula.

% WRITTEN BY       : AM & KE, 1999.04.09
% LAST MODIFIED BY : None 

global DMARGCHK DMOPTIMIZE

if DMARGCHK
  if ~isa(a,'laso'),
    error('Second input argument is not of class LASO');
  end;
end;

mat = getmatrix(a);
v = lgso(getshape(a),getnumberfield(a));

if DMOPTIMIZE & (v.shape == 3),
  v.data = eye(3);
  beta2  = mat(1,2)*mat(1,2)+mat(1,3)*mat(1,3)+mat(2,3)*mat(2,3);
  beta   = sqrt(beta2);
  if (beta > 5.0e-16),
    a = sin(beta)/beta; b = sin(beta/2); c = 2*b*b/beta2;

    S1 = eye(3);
    S1(1,2) = a*mat(1,2); S1(1,3) = a*mat(1,3); S1(2,3) = a*mat(2,3);
    S1(2,1) = -S1(1,2); S1(3,1) = -S1(1,3); S1(3,2) = -S1(2,3);

    S2 = zeros(3,3);
    cS12 = c*mat(1,2); cS13 = c*mat(1,3);
    v2 = cS12*mat(1,2); u2 = cS13*mat(1,3); t2 = c*mat(2,3)*mat(2,3);
    S2(1,1) = -(v2+u2); S2(1,2) = -cS13*mat(2,3); S2(1,3) = cS12*mat(2,3);
    S2(2,1) = S2(1,2); S2(2,2) = -(v2+t2); S2(2,3) = -cS12*mat(1,3);
    S2(3,1) = S2(1,3); S2(3,2) = S2(2,3); S2(3,3) = -(u2+t2);

    v.data = S1+S2;
  else,
    v.data = zeros(3,3);
    v.data(1,1) = exp(mat(1,1));
    v.data(2,2) = exp(mat(2,2));
    v.data(3,3) = exp(mat(3,3));
  end;
else,
  v.data = expm(mat);
end;
return;
