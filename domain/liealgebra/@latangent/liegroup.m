%-*-text-*-
function [g] = liegroup(a)
% LIEGROUP -  Picks out the liegroup LGTANGENT
% function [g] = liegroup(a)
%
% ASSUMPTION:
%             The names are of the form  'laxxx' and 'lgxxx', and that the
%             shape information is of same the type in the algebra as in the
%             group.

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

if iscellempty(a.shape), g = lgtangent; return; end;

name = class(a);
if ~strcmp(name(1:2),'la'),
  error('Do not know how to make this Lie algebra.');
else
  name(2) = 'g';      % laname -> lgname
  g = feval(name);
  sh = getshape(a);
  sh = la2lgshape(sh);
  setshape(g,sh);
end;
return;
