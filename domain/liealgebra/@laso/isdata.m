function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation of LASO.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

v = 1;
n = a(1).shape;
len = length(a);
if isempty(n), v = 0; return; end;
if ~all([size(m,1) size(m,2) size(m,3)] == [n n len]), v = 0; return; end;

for i = 1:len,                % Test if matrix m is skew symmetric.
  tmp = m(:,:,i)'+m(:,:,i);
  normtmp = norm(tmp,'fro');
  if normtmp/n^2 > 10^3*eps, v = 0; return; end;
end;
return;

