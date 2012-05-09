function [s] = getshape(u)
% GETSHAPE - Returns the shape information in LAUN.
% function [s] = getshape(u)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.09

global DMARGCHK

if DMARGCHK
  if ~(hasshape(u))
    error('The Lie algebra contains no dynamic shape information.');
  end;
end;

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
