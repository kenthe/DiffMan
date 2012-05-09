function [w] = dpade22inv(x,z,ord)
% DPADE22INV - Inverse differential of the (2,2) Pade' approximation.
% function [w] = dpade22inv(x,z,ord)

% WRITTEN BY       : Kenth Engø, 1998.06.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(x,z),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

n = getshape(x);
u = getmatrix(x);
v = getmatrix(z);
w = z;
if isabelian(x),			% Abelian Lie algebras
  return;
else,	         	                % Non-Abelian Lie algebras.
  Id = eye(n);
  A = kron(Id,Id) - kron(u',u)/12;
  pu = Id + u/2 + u^2/12;
  b  = (pu - u)*v*pu;			% P(-x) = P(x) - x;
  bv = b(:);
  mat = zeros(n);
  wv = A\bv;
  mat(:) = wv;
  setmatrix(w,mat);
end;
return;
