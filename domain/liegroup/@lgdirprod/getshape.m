function [sh] = getshape(a)
% GETSHAPE - Returns the shape information in LGDIRPROD.
% function [sh] = getshape(a)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

if iscellempty(a.shape), sh = cell(1,2); return; end;
sh = a(1).shape;
return;
