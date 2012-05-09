function [g] = liegroup(a)
% LIEGROUP - Picks out the liegroup corresponding to LADIRPROD.
% function [g] = liegroup(a)
%
% ASSUMPTION: The names are of the form  'laxxx' and 'lgxxx', and that the
%             shape information is of same type in the algebra as in the
%             group.

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

if iscellempty(a.shape), g = lgdirprod; return; end;

name = class(a);
if ~strcmp(name(1:2),'la'),
  error('Do not know how to make that group.');
else
  name(2) = 'g';                        % laname -> lgname
  g = feval(name);
  sh = getshape(a);
  sh = la2lgshape(sh);
  setshape(g,sh);
end;
return;
