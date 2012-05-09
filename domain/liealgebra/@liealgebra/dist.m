function [d] = dist(a,b)
% DIST - Distance metric function on the Lie algebra.
% function [d] = dist(a,b)
%
% Version (space): LIEALGEBRA
%    dist(a,b) == norm(coordvec(a)-coordvec(b));

% WRITTEN BY      : Hans Munthe-Kaas, april 1997
% LAST MODIFIED BY: Kenth Engø, 1999.04.07

d = norm(getvector(a)-getvector(b));
return;
