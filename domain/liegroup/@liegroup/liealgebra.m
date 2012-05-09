function [g] = liealgebra(a)
% LIEALGEBRA - Picks out the liealgebra corresponding to the lie group.
% function [g] = liealgebra(a)
%
% Assumption:
%             The names are of the form  'laxxx' and 'lgxxx', and the
%             shape information is of same type in the algebra as in the
%             group.

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

name = class(a);
if ~strcmp(name(1:2),'lg'),
  error('@liegroup/liealgebra.m don''t know how to make that group');
else
  name(2) = 'a'; 			% lgname -> laname
  g = feval(name);
  setshape(g,getshape(a));
end;
return;
