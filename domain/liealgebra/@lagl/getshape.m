function [n] = getshape(a)
% GETSHAPE - Returns the dynamic shape information in LAGL.
% function [n] = getshape(a)

% WRITTEN BY       : Kenth Engø, 1997.09.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK,
  if ~(hasshape(a)),
    error('The Lie algebra contains no dynamic shape information.');
  end;
end;

if isempty(a(1).shape), n = []; return; end;
n = a(1).shape;
return;
