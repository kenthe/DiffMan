function [s] = getshape(u)
% GETSHAPE - Returns the shape information of LGSE.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
