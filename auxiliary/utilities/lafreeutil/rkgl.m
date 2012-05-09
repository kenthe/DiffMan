function [A,b,c] = rkgl(n)
% RKGL - Runge-Kutta-Gauss-Legendre coefficients of n stages, order 2n.
%
% [A,b,c] = rkgl(n)

% written by Hans Munthe-Kaas, Thanks to :-***** Antonella *****-:
c = roots(slegendre(n));
c = sort(c);
V = vander(c);
V = V(:,n:-1:1);
j = 1./[1:n];
J = diag(j);
C = diag(c);
Vinv = inv(V);
A = C*V*J*Vinv;
b = (ones(1,n)*J*Vinv)';
return;
