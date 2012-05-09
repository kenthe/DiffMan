function [v] = project(a,m)
% PROJECT - Returns matrix 'v' which is acceptable in LGSE.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

n = a.shape;
v = {[] []};
v{1} = project(lgso(n),m{1});
v{2} = project(lgso(n),m{2});
return;
