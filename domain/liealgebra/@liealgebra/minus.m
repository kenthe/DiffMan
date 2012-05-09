function [w] = minus(u,v)
% MINUS - Vector subtraction in Lie algebra.
% function [w] = minus(u,v)
%
% Version (space): LIEALGEBRA - This is the generic version.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 April
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

vec = getvector(u) - getvector(v);
w   = liealgebra(u);
setvector(w,vec);
return;



