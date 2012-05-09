function [v] = getmatrix(a)
% GETMATRIX - Issues a WARNING: LARN does not have a matrix repr.
% function [v] = getmatrix(a)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

disp('      Warning: The LARN-class does not have a matrix representation.');
disp('                Use the functions: ''getdata'' or ''getvector'' instead.');
return;
