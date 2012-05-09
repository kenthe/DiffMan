function [d] = dimension(a)
% DIMENSION - Returns the dimension of the LASO_PQ vectorspace.
% function [d] = dimension(a)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if isempty(a(1).shape), 
    error('Object has no shape'); 
  end;
end;

n = sum(a(1).shape);
d = n*(n-1)/2;
return;

