function z = random(a)
% RANDOM - Creates a random object in the class HMNSPHERE.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isempty(a.shape), z = hmnsphere; return; end; % Generic object.

z = hmnsphere(a.shape);
dat = rand(getshape(a.shape),1);
dat = dat/norm(dat);
z.data = dat;
return;
