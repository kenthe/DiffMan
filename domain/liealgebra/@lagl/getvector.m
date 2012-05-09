function [v] = getvector(g)
% GETVECTOR - Returns a vector representation of objects in LAGL.
% function [v] = getvector(g)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = getmatrix(g);
v = v(:);
return;
