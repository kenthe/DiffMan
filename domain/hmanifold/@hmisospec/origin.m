function [orig] = origin(a)
% ORIGIN - Returns the 'origin' amongst the R^(nxn) matrices.
% function [orig] = origin(a)

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

orig = hmisospec(a);
orig.data = zeros(getshape(a.shape));
return;
