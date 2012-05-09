function m = dcayinv(a,b,ord)
% DCAYINV - The inverse of the differential of the Cayley transform.
% function m = dcayinv(a,b,ord)

% WRITTEN BY       : Kenth Engø, 1998.02.02
% LAST MODIFIED BY : Kenth Engø, 1999.09.08

global DMARGCHK

if DMARGCHK
  if ~sameshape(a,b),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

n = getshape(a);
u = getmatrix(a);
v = getmatrix(b);
m = a;
id = eye(n);
if (ord >= 2),
  mat = (id - u/2)*v*(id + u/2);
else,
  mat = v;
end;
setmatrix(m,mat);
return;

