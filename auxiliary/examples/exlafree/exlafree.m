function [] = exlafree()
% Compute 'Magnus' type integration scheme, based on 
% Gauss-Legendre Runge-Kutta method of order 6.
%
% DiffMan must be initalized.
% >> pwd
% ..../DiffMan
% >> dminit
% ....  
% >> exlafree

format rat;
disp('Finding coefficients of 6.order Magnus type integrator for y'' = a(t)*y :');
disp('-------------------------------------------------------------------------');
[sigma,c,V] = cmagnus(6)
disp('For more information: >> help cmagnus')
disp('====================================');
disp(' ');
disp('Comparing with coeff''s of Iserles-Norsett 6. order Magnus:');
disp('-----------------------------------------------------------');
INsigma = atgeirr6;
disp('  Iserles-Norsett sigma expressed in terms of ai = a(ci*h) as:');
INsigma
disp('  Changing basis, q = V*a, yields INsigma in terms of qi as:');
% Get free algebra of qi: (3 elements, max. order 6, the elements has order 1,2 and 3)
laf = lafree({[3,6],[1,2,3]});
q1 = basis(laf,1);
q2 = basis(laf,2);
q3 = basis(laf,3);
vinv = inv(V);
a1 = vinv(1,1)*q1 + vinv(1,2)*q2 + vinv(1,3)*q3;
a2 = vinv(2,1)*q1 + vinv(2,2)*q2 + vinv(2,3)*q3;
a3 = vinv(3,1)*q1 + vinv(3,2)*q2 + vinv(3,3)*q3;
disp(' ');
% substitute expressions for ai into INsigma:
INsigma = eval(INsigma,cat(1,a1,a2,a3))
disp('Thus, we see the methods are identical (up to order 6).');
disp('*******************************************************');
format short
