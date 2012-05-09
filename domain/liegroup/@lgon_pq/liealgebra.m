function [g] = liealgebra(a)
% LIEALGEBRA - Routine for picking out the liealgebra to LGON_PQ. 
% function [g] = liealgebra(a)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

sh = a.shape;
if isempty(sh), g = laso_pq; else, g = laso_pq(sh); end;
return;
