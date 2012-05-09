function [v] = lambda(a,m,coord)
% LAMBDA - The _LEFT_ coadjoint action of LASE (LGSE) on the dual space; LASE*.
% function [v] = lambda(a,m,coord)
% 
% INPUT:
%   A - LASE-object, where A.data consists of {skew-matrix vector}.
%   M - HMTOP-object, where M.data consists of two vectors: {vec1 vec2}.
%   COORD - String containing the name of the coordinates on the Lie group.

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = hmtop(m);
vec1 = m.data{1};    % Angular momentum.
vec2 = m.data{2};    % Gravity vector.
dat = getmatrix(feval(coord,lgse(3),a));
R = dat{1};
vec = dat{2};
v.data{2} = R*vec2;
v.data{1} = R*vec1 + cross(vec,v.data{2});
return;
