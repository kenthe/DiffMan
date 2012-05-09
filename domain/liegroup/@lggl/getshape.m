function [s] = getshape(u)
% GETSHAPE - Returns shape information of LGGL.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
