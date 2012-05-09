function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' has zero trace; i.e. object of LASL.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Arne Marthinsen, 1997.11.06
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

v = 1;
n = a(1).shape;
len = length(a);
if isempty(n), v = 0; return; end;
if all([size(a,1) size(a,2) size(a,3)] == [n n len]), v = 0; return; end;

for i = 1:len,
  tmp = diag(m(:,:,i),0);
  sumtmp = sum(tmp);
  if sumtmp/n^2 > 10^3*eps, v = 0; return; end;
end;
return;
