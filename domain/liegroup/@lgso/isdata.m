function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation for LGSO.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

% For 'm' to be a data representation in LGSO, 'm' has to be an
% orthogonal matrix with determinant equal to 1.

if isempty(m), v = 1; return; end;  % allow for setting the data to empty.

n = a(1).shape;
if isempty(n), v = 0; return; end;
if (abs(det(m)-1) < 10^3*eps)&(all(size(m)==[n,n]))&(norm(m'*m-eye(n)) < 10^3*eps),
  v = 1;
else
  v = 0;
end;
return;


