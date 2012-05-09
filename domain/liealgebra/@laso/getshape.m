function [s] = getshape(u)
% GETSHAPE - Returns the shape information in the Lie algebra LASO.
% function [s] = getshape(u)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 april
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

if DMARGCHK,
  if ~(hasshape(u))
    error('The Lie algebra contains no dynamic shape information.');
  end;
end;

if isempty(u.shape), s = []; return; end;
s = u.shape;
return;
