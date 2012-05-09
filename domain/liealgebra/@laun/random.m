function z = random(a)
% RANDOM - Creates a random object in LAUN.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1999.04.04
% LAST MODIFIED BY : None

sh = a(1).shape;
z  = laun(a);
zdata = rand(sh) + i*rand(sh);
z.data = project(a,zdata);
return;
