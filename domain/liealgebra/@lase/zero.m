function z = zero(obj)
% ZERO - Create the zero object in a LASE.
% function z = zero(obj)

% WRITTEN BY       : Kenth Engø, 1998.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

n = obj.shape;
z = lase(n);
z.data{1} = zeros(n*(n-1)/2,1);
z.data{2} = zeros(n,1);
return;
