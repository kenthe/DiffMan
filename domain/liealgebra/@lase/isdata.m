function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation in LASE.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 98.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

v = 1;
len = length(a);
n = a(1).shape;
for i = 1:len,
  if ~((length(m{i,1}) == n*(n-1)/2)&(length(m{i,2}) == n)),
    v = 0; return;
  end;
end;
return;

