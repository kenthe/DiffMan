function [d] = dimension(a)
% DIMENSION - Returns the dimension of the LASO vectorspace.
% function [d] = dimension(a)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

n = a(1).shape;
if DMARGCHK,
  if isempty(n), error('Element has no shape'); end;
end;

d = n*(n-1)/2;
return;

