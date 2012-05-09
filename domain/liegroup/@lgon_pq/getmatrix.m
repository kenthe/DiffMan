function [mat] = getmatrix(u)
% GETMATRIX - Returns the matrix representation in LGON_PQ.
% function [mat] = getmatrix(u)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

if isempty(u.data),
  mat = [];
  return;
end;
mat = u.data;
return;
