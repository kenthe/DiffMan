function [sig,c,V] = cmagnus(q)
%CMAGNUS - coefficients of Magnus type integration schemes
%
%Magnus methods: Solves  y' = a(t)*y  (Based on Gauss-Legendre-Runge-Kutta)
%--------------------------------------------------------------------------
%
%  function [sig,c,V] = cmagnus(q)
%
%The answers sig, c and V define a method in the following way:
%
%Example: order 6:
%-------
%
%   [sig,c,V] = cmagnus(6) 
%
%Yields data for the following method:
%
%1) compute:
%  ai = h*a(ci*h), 
%where ci are nodes i GLRK:
%  c = [0.11270     0.50000     0.88730]
%and h is the stepsize.
%  
%2) compute qi from ai as: (this yields a taylor basis around t=1/2)
%        q1 = a2;
%        q2 = -1.291*a1 + 1.291*a3;
%        q3 = 3.3333*a1 - 6.667*a2 + 3.3333*a3;
%In matrix form:
%   q = V*a, where V is the matrix:
%V =
%         0    1.0000         0
%   -1.2910         0    1.2910
%    3.3333   -6.6667    3.3333
%
%3) compute sigma by commuting qi as: ( ex. [1,2] denote [q1,q2])
%sig =
%     [1] + 0.083333*[3] - 0.083333*[1,2] + 0.0041667*[2,3] + 0.0027778*[1,[1,3]] 
%      - 0.0041667*[2,[1,2]] + 0.0013889*[1,[1,[1,2]]]
%        
%4) step forwards:
%y(n+1) = expm(sig)*y(n)
%

% Written by: Hans Munthe-Kaas, October 1997.
% Modified by: None.

[A,b,c] = rkgauss(q);
% define free liealgebra
s = size(A,1);
laf = lafree;
setshape(laf,[{[s,q]},{[1:s]}]);
% compute taylor basis around midpoint 1/2
cm = c-1/2;
V = vander(cm);
k = {};
for i = 1:s,
   tmp = zero(laf);
	for j = 1:s,
	   tmp = tmp+V(i,j)*basis(laf,s+1-j);
	end;
	k = [k {tmp}];
end;
ktild = k;
u = {};
for i = 1:s,
   u = [u {zero(laf)}];
end;
% fixpoint iteration till convergence in last component of u
sigold = zero(laf);
disp(['Fixpoint iteration, ' int2str(q) ' steps:']);
for ord = 1:q,
   for i = 1:s,
      ktild(i) = {dexpinv(u{i},k{i},q)};
   end;
   for i = 1:s,
	   ut = zero(laf);
	   for j = 1:s,
	      ut = ut+A(i,j)*ktild{j};
	   end;
	   u(i) = {ut};
   end;
   disp(['   Done step: ' int2str(ord) ]);
end;
sig = zero(laf);
for i = 1:s,
   sig = sig+b(i)*ktild{i};
end;
% compute the taylor basis wrt. the K's
V = inv(V);
V = V(s:-1:1,:);
