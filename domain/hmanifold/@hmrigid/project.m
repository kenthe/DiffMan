function [v] = project(a,m)
% PROJECT - Returns 'v' which is acceptable by HMRIGID.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

n = getshape(a.shape);      % The length of the correct vectors.
v = hmrigid(a);
if (length(m) == n),
  v.data = m;
else
  error('Input cell vector is of incorrect length!');
end;
return;
