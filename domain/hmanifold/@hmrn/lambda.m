function [v] = lambda(a,m,coord)
% LAMBDA - The _LEFT_ action of an Lie algebra object.
% function [v] = lambda(a,m,coord)
% 
% INPUT:
%         'a'     - Group/algebra-object.
%         'm'     - HMRN-object.
%         'coord' - Coordinates used on the Lie group.

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = hmrn(m);
sh = m.shape;
v.data = getdata(feval(coord,liegroup(sh),a))*m.data;
return;
