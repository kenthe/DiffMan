function [a] = dexpexpinv(x,z,ord)
% DEXPEXPINV - Inverse of differential of canonical coord. of the second kind.
% function [a] = dexpexpinv(x,z,ord)

% WRITTEN BY       : Kenth Engø, 1998.09.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(x,z),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

error('This function is not correct!');

u = getvector(x)
w = getvector(z)
a = z; 
if isabelian(x),			% Abelian Lie algebras.
  return;
end;
if hasmatrix(z),         		% Non-Abelian Lie algebras.
  n = dimension(z);
  v = zeros(n,1);
  v(1) = w(1);
  mat = getmatrix(z);
  xold = getmatrix(basis(z,1));
  for i = 2:n
    xnew = getmatrix(basis(z,i));
    v(i-1)
    mat  = expm(-u(i-1)*xold) * (mat - v(i-1)*xold) * expm(u(i-1)*xold)
    tmp = z; setmatrix(tmp,mat);
    tmp
    vec = getvector(tmp)
    v(i) = vec(i)
    xold = xnew;
    pause
  end;
  setvector(a,v);
  return;
end;

% ... Don't know how to compute the inverse of the differential of the
%     coordinate transform .....
error(['Function not defined in class: ' class(lgr)]);
return;
