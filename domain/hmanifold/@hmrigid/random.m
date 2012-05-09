function z = random(a)
% RANDOM - Creates a random object in HMRIGID.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isempty(a.shape), z = hmrigid; return; end;

sh = getshape(a(1).shape);
z = hmrigid(sh);
z.data = rand(sh,1);
return;

