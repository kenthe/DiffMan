function z = zero(obj)
% ZERO - Create the zero object in LASU.
% function z = zero(obj)

% WRITTEN BY       : Kenth Engø, 1999.04.04
% LAST MODIFIED BY : Kenth Engø, 1999.04.09

n   = obj.shape;
dat = zeros(n);
z   = lasu(obj);
z.data = dat;
return;
