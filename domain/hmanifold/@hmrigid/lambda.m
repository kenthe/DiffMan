function [v] = lambda(a,m,coord)
% LAMBDA - The _LEFT_ coadjoint action of LASO (LGSO) on the dual Lie algebra; LASO*.
% function [v] = lambda(a,m,coord)
% 
% INPUT:
%   A     - LASO-object, where A.data consists of a skew-matrix.
%   M     - HMRIGID-object, where M.data consists of a vector.
%   COORD - Coordinates used on the Lie group.

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = m;
vec = m.data;    % Angular momentum.
lgr = liegroup(m.shape);
mat = getmatrix(feval(coord,lgr,a));
v.data = mat*vec;
return;
