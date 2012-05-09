function [bool] = isdata(a,m)
% ISDATA - Checks if 'm' is a data repr. of 'a' in HMSINEEULER.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

bool = 1;
len = length(a);               % The number of vectors.
n = getshape(a(1).shape);      % The size of the matrices.
for i = 1:len,
  if ~all(size(m(:,i)) == [n/2 1]),
    bool = 0; return;
  end;
end;
return;
