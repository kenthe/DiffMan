function [w] = dexpexp(x,z,ord)
% DEXPEXP - The differential of canonical coordinates of the second kind.
% function [w] = dexpexp(x,z,ord)

% WRITTEN BY       : Kenth Engø, 1998.09.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(x,z),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

u = getvector(x)
v = getvector(z)
w = z; 
if isabelian(x),			% Abelian Lie algebras.
  return;
end;
if hasmatrix(z),         		% Non-Abelian Lie algebras.
  n = dimension(z);
  mat = zeros(getshape(z));
  pm = eye(size(mat)); am = pm; 
  for i = 1:n
    x = getmatrix(basis(z,i));
    mat = mat + v(i)*pm*x*am;
    pm = pm*expm(u(i)*x);
    am = expm(-u(i)*x)*am;
  end;
  setmatrix(w,mat);
  return;
end;

% ... Don't know how to compute the differential of the coordinate 
%     transform .....
error(['Function not defined in class: ' class(lgr)]);
return;
