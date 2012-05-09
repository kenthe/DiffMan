function [v] = lambda(a,m,coord)
% LAMBDA - The _LEFT_ coadjoint action of LGSU on LASU*.
% 
% INPUT:
%   A - LASU-object, where A.data consists of a special skew matrix.
%   M - HMSINEEULER-object, where M.data consists of a vector.
%   COORD - String containing the name of the coordinates on the Lie group.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

v = m;
dat = getmatrix(feval(coord,lgsu,a));
vec = getdata(m);
data = dat*[vec; conj(vec)];
v.data = data(1:4);
return;
