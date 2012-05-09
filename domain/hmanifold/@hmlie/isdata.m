function [bool] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation for HMLIE.
% function [bool] = isdata(a,m)

% WRITTEN BY       : Kenth Engo, 1997.10.28
% LAST MODIFIED BY : Kenth EngÅ¯, 2000.03.29

len = length(a);
tmp(len) = a(len).shape;
for i = 1:len-1,
  tmp(i) = a(i).shape;
end;
bool = isdata(tmp,m);
return;
