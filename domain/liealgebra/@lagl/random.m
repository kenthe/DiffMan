function z = random(a)
% RANDOM - Creates a random object in LAGL.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

n = a.shape;
z  = lagl(a);
if strcmp(a.field,'R'),
  zdata = rand(n);
elseif strcmp(a.field,'C')
  zdata = rand(n) + i*rand(n);
end;
z.data = zdata;
return;
