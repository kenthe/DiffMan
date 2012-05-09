function [s] = getshape(u)
% GETSHAPE - Returns the shape information in LARN.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

sh = u(1).shape;
if DMARGCHK,
  if isempty(sh), s = []; return; end;
end;

s = sh;
return;
