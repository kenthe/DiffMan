function [j] = sameshape(a,b)
% SAMESHAPE - Chechs if a and b belong to the same Lie algebra.
% function [j] = sameshape(a,b)
%
% Assumes that the == operator is defined for the shape type in the class.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

j = 1;
if DMARGCHK
  if ~strcmp(class(a),class(b)), j = 0; return; end;
end;

if hasshape(a),
   if ~(all(getshape(a)==getshape(b))), j = 0; return; end;
end;
return;
