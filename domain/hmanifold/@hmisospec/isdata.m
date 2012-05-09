function [bool] = isdata(a,m)
% ISDATA - Checks if m (a matrix!) is data for an element of HMISOSPEC
% function [bool] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

bool = 1;
n = getshape(a(1).shape);
if isempty(n), bool = 0; return; end;
len = length(a);

if ~all([size(m,1) size(m,2) size(m,3)] == [n n len]),
  bool = 0;
end; 
return;
