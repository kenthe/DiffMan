function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation for LARN.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997.10.06
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = 1;
n = a(1).shape;
len = length(a);
if isempty(n), v = 0; return; end;
if ~(all(size(m)==[n*len,1])), v = 0; return; end;
return;


