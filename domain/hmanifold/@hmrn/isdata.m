function [bool] = isdata(a,m)
% ISDATA - Checks if m is a data repr. of the element a.
% function [bool] = isdata(a,m)
%
% REMARK: This function checks if 'm' has the correct length
%         and is different from the zero vector. (The trivial
%         component has to be excluded in order to make the
%         action transitive).

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

bool = 1;
len = length(a);
n = getshape(a(1).shape);

if ~all(size(m) == [n*len 1]), bool = 0; return; end;
m = reshape(m,n,len);
for i = 1:len,
  if abs(sum(m(:,i)) - 0) < 10^3*eps, 
    bool = 0; return;
  end;
end;
return;
