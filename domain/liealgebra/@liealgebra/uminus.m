function [w] = uminus(u)
% UMINUS - Unary minus in Lie algebra.
% function [w] = uminus(u)
%
% Version (space): LIEALGEBRA - This is the generic version.

% WRITTEN BY       : Kenth Engø, 1999.04.07
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = -getvector(u);
w = liealgebra(u);
setvector(w,v);
return;
