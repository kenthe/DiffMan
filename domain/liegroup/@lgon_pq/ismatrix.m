function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is a matrix representation in LGSO_PQ.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1999.04.06
% LAST MODIFIED BY : None

n = sum(a(1).shape);
if isempty(a(1).shape), v = 0; return; end;
J = diag([ones(1,a(1).shape(1)) -ones(1,a(1).shape(2)) ]);
if (all(size(m)==[n,n]))&(norm(m'*J*m-J) < 10^3*eps),
  v = 1;
else
  v = 0;
end;
return;
