function v = expexp(lgr,a)
% EXPEXP - Computes canonical coordinates of the second kind.
% function v = expexp(lgr,a)
%
% Assumption: This function is generic and handles two cases;
%       Abelian algebra : expexp(lgr,a) = a;
%       Matrix algebra  : expexp(lgr,a) = prod_i exp(a_1*v_i), x_i basis.

% WRITTEN BY       : Kenth Engø, 1998.09.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liealgebra'),
    error('Second argument is not of type: liealgebra');
  end;
end;

v  = liegroup(a);
vv = getvector(a);
if isabelian(a)			        % Abelian case.
  setvector(v,vv);
  return;
end;
if hasmatrix(a),			% Matrix case.
  n = dimension(a);
  mat = eye(size(getmatrix(a)));
  for i = 1:n
    x = getmatrix(basis(a,i));
    m = expm(vv(i)*x);
    mat = mat*m;
  end;
  setmatrix(v,mat);
  return;
end;

% ... Don't know how to compute the coordinate transform ...
error(['Function not defined in class: ' class(lgr)]);
return;

