function [d] = basis(a,i)
% BASIS - Returns the i'th basis vector in the Lie algebra.
% function [d] = basis(a,i)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

n = dimension(a);
v = zeros(n,1);
v(i) = 1;
d = liealgebra(a);
setvector(d,v);
return;
