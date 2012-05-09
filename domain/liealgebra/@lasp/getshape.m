function [s] = getshape(u)
% GETSHAPE - Returns the shape information of LASP.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

if isempty(u(1).shape), s = []; return; end;
s = u(1).shape;
return;
