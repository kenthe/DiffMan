function z = random(a)
% RANDOM - Creates a random object in HMSINEEULER.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

if isempty(a.shape), z = hmsineeuler; return; end;

n = getshape(a.shape);
z = hmsineeuler(sqrt(n+1));
z.data = rand(n/2,1) + i*rand(n/2,1);
return;

