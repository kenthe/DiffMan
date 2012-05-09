function m = dcayinv(a,b,ord)
% DCAYINV - The inverse of the differential of the Cayley transform.
% function m = dcayinv(a,b,ord)

% WRITTEN BY       : Kenth Engø, 1998.02.02
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if a.shape ~= b.shape,
    error('Arguments are not in the same Lie algebra!');
  end;
end;

n = a.shape;
umat = skew(a.data{1});
vmat = skew(b.data{1});
uvec = a.data{2};
vvec = b.data{2};
id = eye(n);
mat = (id - umat/2)*vmat*(id + umat/2);
vec = 0.5*(vmat*uvec-0.5*umat*vmat*uvec-umat*vvec)+vvec;
m = a;
setmatrix(m,{mat vec});
return;
