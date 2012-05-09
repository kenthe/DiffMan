function [bool] = isdata(a,m)
% ISDATA - Checks if m is a data represenation for the N-sphere.
% function [bool] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

bool = 1;
n = getshape(a(1).shape);
if isempty(n), bool = 0; return; end;
len = length(a);
if ~(length(m) == n*len), error('Vector is not of correct length!'); end;
m = reshape(m,n,len);
for i = 1:len,
  if ~(abs(m(:,i)'*m(:,i)-1) < 1000*eps), bool = 0; return; end;
end;
return;
