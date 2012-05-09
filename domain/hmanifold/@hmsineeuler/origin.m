function [orig] = origin(a)
% ORIGIN - Returns the 'origin' in the HMSINEEULER-space.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

orig = hmsineeuler(a(1));
n    = getshape(a(1).shape);
orig.data = zeros(n/2,1);
return;
