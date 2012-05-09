function z = random(a)
% RANDOM - Creates a random object in LASE.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1998.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

n = a(1).shape;
z = lase(n);
z.data{1} = rand(n*(n-1)/2,1);
z.data{2} = rand(n,1);
return;

