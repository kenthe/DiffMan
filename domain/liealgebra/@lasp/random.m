function z = random(a)
% RANDOM - Creates a random object in LASP.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

sh = a(1).shape;
z  = lasp(a);
if strcmp(a(1).field,'R'),
  zdata = rand(sh);
elseif strcmp(a(1).field,'C')
  zdata = rand(sh) + i*rand(sh);
end;
z.data = project(a,zdata);
return;
