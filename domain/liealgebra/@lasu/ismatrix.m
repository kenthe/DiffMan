function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is skew Hermitian with zero trace.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.09

v = 1;
n = a(1).shape;
len = length(a);
if isempty(n), v = 0; return; end;
if ~all([size(m,1) size(m,2) size(m,3)] == [n n len]), v = 0; return; end;

% Test if matrix m is skew Hermitian and has zero trace.
for i = 1:len,
  tmp = m(:,:,i)'+m(:,:,i);
  normtmp = norm(tmp,'fro');
  if normtmp/n^2 > 10^3*eps, v = 0; return; end;
  if norm(trace(m(:,:,i))) > 10^3*eps, v = 0; return; end;
end;
return;
