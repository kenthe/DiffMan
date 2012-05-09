function [s] = getshape(u)
% GETSHAPE - Returns the shape information of LGON.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Eng�, 1997.10.09
% LAST MODIFIED BY : Kenth Eng�, 1999.04.12

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
