function [w] = plus(u,v)
% PLUS - Vector addition in Lie algebra.
% function [w] = plus(u,v)
%
% Version (space): LIEALGEBRA - This is the generic version.

% WRITTEN BY       : Hans Munthe-Kaas, april 1997
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

vec = getvector(u) + getvector(v);
w   = liealgebra(u);
setvector(w,vec);
return;
