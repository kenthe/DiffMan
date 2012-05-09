function [b] = xpolar(nmax)
%
%    XPOLAR   Coefficients of the X(t)  factor in the polar decomposition of
%       in Lie groups.
%    X = XPOLAR(N) returns the N-dimensional vector X whose i-th component 
%       is the coefficient of t^(i) in the series expansion of the function X(t)
%       arising in the polar decomposition on Lie groups. 
%
%       Such decomposition is such that, if Z=K+P, then exp(tZ) = exp(X(t))*exp(Y(t))
%       with exp(X(t)) in a symmetric space and exp(Y(t)) in a subgroup of the given
%       Lie group G.
%       
%       Refer to (A. Zanna, Recurrence relations for the factors in the polar
%       decomposition on Lie groups, Report in Informatics, University of Bergen, 2000)
%       for background theory.
%       
%       See also YPOLAR, LAFPOLAR, NBCH.
%

%  Written by: H. Munthe-Kaas and A. Zanna, March 2000
%  Last modified by: A. Zanna, 5.5.2000

laf = lafree({[2,nmax],[1,1]});
X = basis(laf,1);
Y = basis(laf,2);
b = zeros(laf,nmax);
b(1) = X;
for n = 1:nmax-1,
	newx = [Y,b(n)];
	p = 1;
	while 2*p<=n, % loop over l
	    psum = zero(laf); % inner sum
		lp = firstpartition(n,2*p);
		while ~(all(lp==0)), % loop over all partitions
			comm = X; % build commutator
			for j = length(lp):-1:1,
				comm = [b(lp(j)),comm];
			end;
			psum = psum+comm;
			lp = nextpartition(lp);
	    end;
		newx = newx+psum*(bernoulli(2*p)*2^(2*p)/prod(1:2*p));
		p = p+1;
    end;
	b(n+1) = newx*(1/(n+1));
end;
