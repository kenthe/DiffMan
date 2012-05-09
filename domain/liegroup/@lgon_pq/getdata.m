function [dat] = getdata(u)
% GETDATA - Returns the data representation in LGON_PQ.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

if isempty(u.data),
  dat = [];
  return;
end;
dat = u.data;
return;
