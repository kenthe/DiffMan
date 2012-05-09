function [orig] = origin(a)
% ORIGIN - Returns the origin on the N-sphere.
% function [orig] = origin(a)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

orig = hmnsphere(a);
vec = zeros(getshape(orig.shape),1); vec(1) = 1;
orig.data = vec;
return;
