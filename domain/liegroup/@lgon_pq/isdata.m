function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation for LGON_PQ.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

n = sum(a(1).shape);
if isempty(a(1).shape), v = 0; return; end;
if isempty(m), v = 1; return; end;  % allow for setting the data to empty.
J = diag([ones(1,a(1).shape(1)) -ones(1,a(1).shape(2)) ]);
if (all(size(m)==[n,n]))&(norm(m'*J*m-J) < 10^3*eps),
  v = 1;
else
  v = 0;
end;
return;


