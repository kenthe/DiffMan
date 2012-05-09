function [d] = dimension(a)
% DIMENSION - Returns the complex vector space dimension of LASU.
% function [d] = dimension(a)

% WRITTEN BY       : Kenth Eng�, 1999 Mar.
% LAST MODIFIED BY : Kenth Eng�, 1999.04.07

global DMARGCHK

n = a(1).shape;
if DMARGCHK
  if isempty(n), error('Element has no shape'); end;
end;

d = (n*n-1)/2;
return;

