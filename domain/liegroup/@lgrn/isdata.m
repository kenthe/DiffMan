function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is possible data representation for LGRN.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

v = 1;
% Check if m is a vector of correct shape.
n = a(1).shape;
len = length(a);
if isempty(n), v = 0; return; end;
if isempty(m), v = 1; return; end;  % allow for setting the data to empty.
if ~(all(size(m)==[n*len,1])), v = 0; return; end;
return;

