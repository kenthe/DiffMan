function [dat] = getdata(u)
% GETDATA - Returns the data representation in LGSO.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

if isempty(u.data),
  dat = [];
  return;
end;
dat = u.data;
return;
