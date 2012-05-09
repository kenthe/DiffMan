function z = random(a)
% RANDOM - Creates a random object in HMTOP.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isempty(a.shape), z = hmtop; return; end;

sh = getshape(a.shape);
z = hmtop(sh);
z.data{1} = rand(sh,1);
z.data{2} = rand(sh,1);
return;

