function [d] = dist(a,b)
% DIST - Distance metric function on the homogeneous manifold.
% function [d] = dist(a,b)
%
% Version (space): HMANIFOLD
%    dist(a,b) == norm(getdata(a) - getdata(b));

% WRITTEN BY       : Kenth Engø, 1997.10.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

d = norm(getdata(a) - getdata(b));
return;
