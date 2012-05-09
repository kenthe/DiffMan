function [c] = inv(a)
% INV - Returns the invers of an object in LGSE.
% function [c] = inv(a)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

n = a.shape;
m = a.data{1};
v = a.data{2};

c = lgse(3);
c.data{1} = m';
c.data{2} = -m'*v;
return;
