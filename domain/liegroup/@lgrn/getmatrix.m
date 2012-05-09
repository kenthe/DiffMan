function [v] = getmatrix(a)
% GETMATRIX - Issues a WARNING: LGRN does not have a matrix repr.
% function [v] = getmatrix(a)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

disp('      Warning: The LGRN-class does not have a matrix representation.');
disp('                Use the functions: ''getdata'' or ''getvector'' instead.');
return;
