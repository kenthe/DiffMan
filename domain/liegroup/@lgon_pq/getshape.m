function [s] = getshape(u)
% GETSHAPE - Returns the shape information in the Lie group LGON_PQ.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
