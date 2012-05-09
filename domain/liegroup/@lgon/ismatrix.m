function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is a matrix representation of LGON.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

n = a.shape;
if isempty(n), v = 0; return; end;
if (norm(m*m'-eye(n)) < 10^3*eps)&(all(size(m)==[n,n])),
  v = 1;
else
  v = 0;
end;
return;
