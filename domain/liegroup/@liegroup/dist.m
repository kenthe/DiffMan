function [d] = dist(a,b)
% DIST - Distance metric function on the Lie group.
% function [d] = dist(a,b)
%
% Version (space): LIEGROUP
%    dist(a,b) == norm(getmatrix(a) - getmatrix(b));

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

d = norm(getdata(a) - getdata(b));
return;
