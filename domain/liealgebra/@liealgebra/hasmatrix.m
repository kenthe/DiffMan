function [v] = hasmatrix(g)
% HASMATRIX - Checks if the Lie algebra has a matrix representation.  
% function [v] = hasmatrix(g)
%
% Remark:
%    This function does not check if a matrix has really been assigned to
%    the element g. 

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

error(['Function not defined in class: ' class(g)]);
return;
