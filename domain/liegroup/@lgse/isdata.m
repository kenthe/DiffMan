function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation in LGSE.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

n = a.shape;
if isempty(n), v = 0; return; end;
if isempty(m), v = 1; return; end;  % allow for setting the data to empty.
v = ismatrix(lgso(n),m{1})*isdata(lgrn(n),m{2});
return;


