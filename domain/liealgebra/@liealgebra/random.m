function z = random(lalg)
% RANDOM - Creates a random object in the Lie algebra.
% function z = random(lalg)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 March.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

n = dimension(lalg);
if strcmp(getnumberfield(lalg),'R'),   % Reals.
  v = 2*rand(n,1)-ones(n,1);
else,                                  % Complex.
  v = 2*rand(n,1)-ones(n,1) + i*(2*rand(n,1)-ones(n,1));
end;
z = liealgebra(lalg);
setvector(z,v);
return;
