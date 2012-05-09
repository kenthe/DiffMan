function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is possible matrix repr. for LAGL.
% function [v] = ismatrix(a,m)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

v = 1;
n = a(1).shape;
if isempty(n), v = 0; return; end;
if ~(all([size(m,1) size(m,2) size(m,3)]==[n,n,length(a)])), v = 0; return;
end;
return;
