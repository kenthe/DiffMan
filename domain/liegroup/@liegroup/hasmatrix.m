function [v] = hasmatrix(g)
% HASMATRIX - Returns if the Lie group has a matrix representation.  
% function [v] = hasmatrix(g)
%
% Remark:
%    This function does not check if a matrix has really been assigned to
%    the element g. 

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

error(['Function not defined in class: ' class(g)]);
return;
