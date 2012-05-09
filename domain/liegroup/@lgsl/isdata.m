function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation in LGSL.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Eng�, 1997.10.09
% LAST MODIFIED BY : Kenth Eng�, 2000.03.29

n = a.shape;
if isempty(n), v = 0; return; end;
if isempty(m), v = 1; return; end;  % allow for setting the data to empty.
if (abs(det(m)-1) < 10^3*eps)&(all(size(m)==[n,n])),
  v = 1;
else
  v = 0;
end;
return;


