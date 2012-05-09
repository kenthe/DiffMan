% BCH: [z,k] = bch(q); (compute BCH up to order q)
function [z,k] = bch2(q)
% get coeff's of s-stage q'th order gauss-legendre runge kutta method
[A,b,c] = rkgl(ceil(q/2));
s = length(b);
%[A,b,c,s] = glrk_coeff(q);
laf = lafree({[2,q],[1,1]}); 
x = basis(laf,1); y = basis(laf,2);
u = zeros(laf,s); k = u;
repprogress('Fixpoint iteration in BCH:');
for ifixp = 1:q, 
	repprogress(ifixp,1,q);
	for i = 1:s,
	   u(i) = y+A(i,1:s)*k;
		k(i) = dexpinv(u(i),x,ifixp); % approx up to order ifixp
	end; 
end;
z = y + b*k;
return;
