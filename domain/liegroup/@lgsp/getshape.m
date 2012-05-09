function [s] = getshape(u)
% GETSHAPE - Returns the shape information of the Lie group LGSP.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
