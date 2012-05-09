function m = dcay(a,b,ord)
% DCAY - The differential of the Cayley transform.
% function m = dcay(a,b,ord)

% WRITTEN BY       : Kenth Engø, 1998.02.05
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

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
mat = inv(eye(n) - u/2)*v*inv(eye(n) + u/2);
setmatrix(m,mat);
return;
