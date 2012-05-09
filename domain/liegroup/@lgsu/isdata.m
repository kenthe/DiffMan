function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is possible data representation for LGSU.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

n = a.shape;
if isempty(n), v = 0; return; end;
if isempty(m), v = 1; return; end;  % allow for setting the data to empty.
if (abs(det(m)-1) < 10^3*eps) & (all(size(m)==[n,n])) & (sum(sum(m'*m-eye(n))) < 10^3*eps),
  v = 1;
else
  v = 0;
end;
return;


