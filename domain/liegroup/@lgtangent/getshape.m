%-*-text-*-
function [sh] = getshape(a)
% GETSHAPE - Returns the shape information in LGTANGENT.
% function [sh] = getshape(a)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

if iscellempty(a.shape), sh = cell(1,2); return; end;
sh = a(1).shape;
return;
