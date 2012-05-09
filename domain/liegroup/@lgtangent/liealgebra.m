%-*-text-*-
function [g] = liealgebra(a)
% LIEALGEBRA -  Picks out the liealgebra LATANGENT
% function [g] = liealgebra(a)
%
% ASSUMPTION:
%             The names are of the form  'laxxx' and 'lgxxx', and that the
%             shape information is of same the type in the algebra as in the
%             group.

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

if iscellempty(a.shape), g = latangent; return; end;

name = class(a);
if ~strcmp(name(1:2),'lg'),
  error('Do not know how to make this Lie algebra.');
else
  name(2) = 'a';                        % lgname -> laname
  g = feval(name);
  sh = getshape(a);
  sh = lg2lashape(sh);
  setshape(g,sh);
end;
return;
