function v = caycay(lgr,a)
% CAYCAY - Computes Cayley coordinates of the second kind.
% function v = caycay(lgr,a)
%
% Assumption: This function is generic and handles two cases;
%       Abelian algebra : caycay(lgr,a) = a;
%       Matrix algebra  : caycay(lgr,a) = prod_i cay(a_1*v_i), x_i basis.

% WRITTEN BY       : Kenth Engø, 1998.09.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liealgebra'),
    error('Second argument is not of type: liealgebra');
  end;
end;

v = identity(liegroup(a));
vv = getvector(a);
if isabelian(a)			        % Abelian case.
  setvector(v,vv);
  return;
end;
if hasmatrix(a),			% Matrix case.
  n = dimension(a);
  id = eye(size(getmatrix(a)))
  mat = id;
  for i = 1:n
    x = getmatrix(basis(a,i));
    m = inv(id - vv(i)*x/2)*(id + vv(i)*x/2);
    mat = mat*m;
  end;
  setmatrix(v,mat);
  return;
end;

% ... Don't know how to compute the coordinate transform ...
error(['Function not defined in class: ' class(lgr)]);
return;

