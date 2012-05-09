function [g] = liealgebra(a)
% LIEALGEBRA -  Picks out the liealgebra LGDIRPROD.
% function [g] = liealgebra(a)
%
% ASSUMPTION:
%             The names are of the form  'laxxx' and 'lgxxx', and that the
%             shape information is of same type in the algebra as in the
%             group.

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

if iscellempty(a.shape), g = ladirprod; return; end;

name = class(a);
if ~strcmp(name(1:2),'lg'),
  error('Do not know how to make that Lie algebra.');
else
  name(2) = 'a';                        % lgname -> laname
  g = feval(name);
  sh = getshape(a);
  sh = lg2lashape(sh);
  setshape(g,sh);
end;
return;
