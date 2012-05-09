%-*-text-*-
function [v] = getdata(g)
% GETDATA - Returns the data representation in LATANGENT.
% function [v] = getdata(g)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

if isempty(g.data), v = {{}{}}; else, v = g.data; end;
return;
