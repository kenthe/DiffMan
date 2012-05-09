function [s] = getshape(u)
% GETSHAPE - Returns the shape information of LASL.
% function [s] = getshape(u)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 april
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
