function [d] = dimension(a)
% DIMENSION - Returns the (real/complex) dimension of LASL.
% function [d] = dimension(a)     

% WRITTEN BY       : Arne Marthinsen, 1997.11.06
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.06

global DMARGCHK

n = a(1).shape;
if DMARGCHK,
  if isempty(n), 
    error('Element has no shape'); 
  end;
end;

d = n*n-1; 
return;

