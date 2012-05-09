function [g] = liegroup(a)
% LIEGROUP - Picks out the liegroup corresponding to the liealgebra.
% function [g] = liegroup(a)
%
% ASSUMPTION:
%             The names are of the form  'laxxx' and 'lgxxx', and that the
%             shape information is of same type in the algebra as in the
%             group.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

name = class(a);
if ~strcmp(name(1:2),'la'),
  error('@liealgebra/liegroup.m dont know how to make that group');
else
  name(2) = 'g'; 			% laname -> lgname
  g = feval(name);
  setshape(g,getshape(a));
end;
return;
