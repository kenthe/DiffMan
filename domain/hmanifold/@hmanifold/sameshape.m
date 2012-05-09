function [j] = sameshape(a,b)
% SAMESHAPE - Checks if input has the same shape information.
% function [j] = sameshape(a,b)

% WRITTEN BY       : Kenth Engø, 1997.10.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

j = 1;
if DMARGCHK
  if ~strcmp(class(a),class(b)), j = 0; return; end;
end;

if hasshape(a),
  if ~sameshape(getshape(a),getshape(b)), 
    j = 0; return; 
  end;
end;
return;

