function [v] = ismatrix(a,m)
% ISMATRIX - Checks if cell-vector 'm' is matrix representation in LASE.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 98.01.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

v = 1;
len = length(a);
sh = a(1).shape;
for i = 1:len,
  if ~(isdata(laso(sh),m{i,1})&isdata(larn(sh),m{i,2}))
    v = 0; return;
  end;
end;
return;
