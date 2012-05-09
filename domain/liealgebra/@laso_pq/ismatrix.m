function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is a matrix representation in LASO_PQ.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

v = 1;
n = sum(a(1).shape);
len = length(a);
if isempty(a(1).shape), v = 0; return; end;
if ~all([size(m,1) size(m,2) size(m,3)] == [n n len]), v = 0; return; end;

J = diag([ones(1,a(1).shape(1)),-ones(1,a(1).shape(2))]);
for i = 1:len,
  tmp = J*m(:,:,i)' + m(:,:,i)*J;
  normtmp = norm(tmp,'fro');
  if normtmp/n^2 > 10^3*eps, v = 0; return; end;
end;
return;
