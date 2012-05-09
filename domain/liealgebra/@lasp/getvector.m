function [v] = getvector(g)
% GETVECTOR - Returns the vector representation LASP.
% function [v] = getvector(g)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

v = getmatrix(g);
if isempty(v), v = []; return; end;
v = v(:);
return;
