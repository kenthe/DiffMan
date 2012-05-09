function [z] = bch(q,n)
%BCH - coefficients of Baker-Campbell-Hausdorff formula of order q, n flows.
%
% [z] = bch(q,n)
%
% Given n matrices in a Lie algebra, X1,X2,...,Xn. This routine
% computes symbolically a matrix Z such that 
%   expm(Z) = expm(X1)*expm(X2)*...*expm(Xn).
%
% The result is given in a free Lie algebra as an expression in
% terms of iterated commutators of the Xi. The infinite sequence is
% truncated at terms of order greater than q.
%
% See also: >> help lafree

% WRITTEN BY       : Hans Munthe-Kaas, October 1997.
% LAST MODIFIED BY : Kenth Engø, 1998.03.03

if nargin==1,
   n = 2;
end;
% runge-kutta-gauss-legendre of order at least q:
[A,b,c] = rkgl(ceil(q/2));
% define free liealgebra
s = size(A,1);
laf = lafree;
setshape(laf,[{[n,q]}]);
% compute bch for two symbols
x = basis(laf,1);
y = basis(laf,2);
u = {};
for i = 1:s,
   u = [u {zero(laf)}];
end;
ktild = u;
% fixpoint iteration till convergence in last component of u
disp(['Fixpoint iteration, ' int2str(q) ' steps:']);
for ord = 1:q,
  for i = 1:s,
    ktild(i) = {dexpinv(u{i},x,q)};
  end;
  for i = 1:s,
    ut = y;
    for j = 1:s,
      ut = ut+A(i,j)*ktild{j};
    end;
    u(i) = {ut};
  end;
  disp(['   Done step: ' int2str(ord) ]);
end;
sig = y;
for i = 1:s,
   sig = sig+b(i)*ktild{i};
end;
% apply sigma to pairs of flows.
z = sig;
disp(['Composing ' int2str(n) ' flows:']);
for i = 3:n,
   z = eval(sig,cat(1,z,basis(laf,i)));
   disp(['   Done step: ' int2str(i) ]);
end;
return;
