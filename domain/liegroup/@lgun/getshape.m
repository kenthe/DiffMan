function [s] = getshape(u)
% GETSHAPE - Returns the shape information in LGUN.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.09

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
