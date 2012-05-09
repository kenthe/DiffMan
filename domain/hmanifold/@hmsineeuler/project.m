function [v] = project(a,m)
% PROJECT - Returns a vector 'v' which is near 'm' in HMSINEEULER.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

n = getshape(a.shape);
if all(size(m) == [n/2 1]),
  v = m;
else
  error('Input matrix is not of correct size!');
end;
return;
