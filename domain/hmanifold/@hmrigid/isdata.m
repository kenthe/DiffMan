function [bool] = isdata(a,m)
% ISDATA - Checks if m is a data repr. of elements in HMRIGID.
% function [bool] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

bool = 1;
len  = length(a);                  % The number of vectors.
n    = getshape(a(1).shape);       % The length of the vectors.
for i = 1:len,
  if (length(m(:,i)) ~= n),
    bool = 0; return;
  end;
end;
return;
