function [w] = dcaycayinv(x,z,ord)
% DCAYCAYINV - Inverse of the differential of Cayley coord. of the second kind.
% function [w] = dcaycayinv(x,z,ord)

% WRITTEN BY       : Kenth Engø, 1998.09.21
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(x,z),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

error('DOES NOT WORK CORRECTLY YET!');

u = getvector(x);
v = getvector(z);
w = z; 
if isabelian(x),			% Abelian Lie algebras.
  return;
end;
if hasmatrix(z),         		% Non-Abelian Lie algebras.
  n = dimension(z);
  mat = zeros(getshape(z));
  id = eye(size(mat));
  pm = id; am = id; 
  for i = 1:n
    x = getmatrix(basis(z,i));
    mat = mat + v(i)*(1+u(i)^2/4)*pm*x*am;
    pm = (id - u(i)*x/2)*inv(id + u(i)*x/2)*pm;
    am = am*(id + u(i)*x/2)*inv(id - u(i)*x/2);
  end;
  setmatrix(w,mat);
  return;
end;

% ... Don't know how to compute the inverse of the differential of the
%     coordinate transform .....
error(['Function not defined in class: ' class(lgr)]);
return;
