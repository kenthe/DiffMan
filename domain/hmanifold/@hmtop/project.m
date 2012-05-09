function [v] = project(a,m)
% PROJECT - Returns 'v' which is acceptable by HMTOP.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1998.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

n = getshape(a.shape);      % The length of the correct vectors.
v = hmtop(a);
if (length(m{1}) == n)&(length(m{2}) == n),
  v.data{1} = m{1};
  v.data{2} = m{2};
else
  error('Input cell matrix contains vectors of incorrect length!');
end;
return;
