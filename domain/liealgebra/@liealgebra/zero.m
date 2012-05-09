function z = zero(lalg)
% ZERO - Create the zero object in a Lie algebra.
% function z = zero(lalg)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 March
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

n = dimension(lalg);
zv = zeros(n,1);
z = liealgebra(lalg);
setvector(z,zv);
return;
