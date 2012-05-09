function [g] = liealgebra(a)
% LIEALGEBRA - Picks out the liealgebra of the homogeneous space.
% function [g] = liealgebra(a)

% WRITTEN BY       : Kenth Engø, 1997.10.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

g = liealgebra(getshape(a));
return;
