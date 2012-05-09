function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is a matrix representation for LGSU.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

% For 'm' to be a matrix repr. of an element in 'lgsu', m has to be a
% Hermitian complex with determinant equal to 1.

v = isdata(a,m);
return;
