function [bool] = isdata(a,m)
% ISDATA - Checks if m is a data repr. of elements in HMTOP.
% function [bool] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

bool = 1;
len = length(a);               % The number of pairs of vectors.
n = getshape(a(1).shape);      % The length of the vectors.
for i = 1:len,
  if (length(m{i,1}) ~= n)&(length(m{i,2}) ~= n)
    bool = 0; return;
  end;
end;
return;
