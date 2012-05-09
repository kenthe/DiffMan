function [dat] = getdata(u)
% GETDATA - Returns the data representation in LGUN.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.09

if isempty(u.data),
  dat = [];
  return;
end;
dat = u.data;
return;
