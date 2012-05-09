function [d] = dimension(a)
% DIMENSION - Returns the complex vector space dimension of LAUN.
% function [d] = dimension(a)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

global DMARGCHK

n = a(1).shape;
if DMARGCHK
  if isempty(n), error('Element has no shape'); end;
end;

d = n*n/2;
return;

