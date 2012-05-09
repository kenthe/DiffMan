function [b] = nbch(nmax)
%  NBCH   BCH formula
%    Z = NBCH(N) computes the BCH formula of two entries, say [1], [2], so that
%    exp(Z) = exp([1]) exp([2]). This formula is similar to BCH but it differs
%    in the way it is implemented, since it employs an explicit recurrence 
%    relation, whereas BCH solves a differential equation.
% 
%    See also BCH.

% Written by: H. Munthe-Kaas and A. Zanna,  March 2000
% Last modified by: A. Zanna, 5.5.2000

laf = lafree({[2,nmax],[1,1]});
X = basis(laf,1);
Y = basis(laf,2);
b = zeros(laf,nmax);
b(1) = X+Y;
for n = 1:nmax-1,
	newx = (1/2)*[X-Y,b(n)];
	p = 1;
	while 2*p<=n, % loop over l
	    psum = zero(laf); % inner sum
		lp = firstpartition(n,2*p);
		while ~(all(lp==0)), % loop over all partitions
			comm = X+Y; % build commutator
			for j = length(lp):-1:1,
				comm = [b(lp(j)),comm];
			end;
			psum = psum+comm;
			lp = nextpartition(lp);
	    end;
		newx = newx+psum*(bernoulli(2*p)/prod(1:2*p));
		p = p+1;
    end;
	b(n+1) = newx*(1/(n+1));
end;
