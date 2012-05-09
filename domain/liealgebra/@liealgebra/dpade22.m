function [w] = dpade22(x,z,ord)
% DPADE22 - Differential of the (2,2) Pade' approximation of exponential map.
% function [w] = dpade22(x,z,ord)

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
if isabelian(x),			% Abelian Lie algebras.
  return;
else					% Non-Abelian Lie algebras.
  pu = eye(n) + u/2 + u^2/12;
  mat = inv(pu-u)*(v - u*v*u/12)*inv(pu);
  setmatrix(w,mat);
end;
return;
