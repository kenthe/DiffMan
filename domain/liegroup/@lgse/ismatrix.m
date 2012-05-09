function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is a matrix representation in LGSE.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

n = a.shape;
if isempty(n), v = 0; return; end;
v = ismatrix(lgso(n),m{1})*isdata(lgrn(n),m{2});
return;
