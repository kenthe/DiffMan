function [orig] = origin(a)
% ORIGIN - Returns the 'origin' in the HMRIGID-space; zeros(n,1).
% function [orig] = origin(a)

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

orig = hmrigid(a);
vec = zeros(getshape(orig.shape),1);
orig.data = vec;
return;
