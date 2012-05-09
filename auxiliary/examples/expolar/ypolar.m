function [b] = ypolar(nmax)
%
%   YPOLAR   Coefficients of the Y(t)  factor in the polar decomposition of
%       in Lie groups.
%       
%       Y = YPOLAR(N) returns the N-dimensional vector Y whose i-th component 
%       is the coefficient of t^(i) in the series expansion of the function Y(t)
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
%       See also XPOLAR, LAFPOLAR, NBCH.
%

%  Written by: H. Munthe-Kaas and A. Zanna, March 2000
%  Last modified by: A. Zanna, 5.5.2000

laf = lafree({[2,nmax],[1,1]});
P = basis(laf,1);
K = basis(laf,2);
Z = P+K;
W = P-K;
b = zeros(laf,nmax);
b(1) = K;
b(2) = zero(laf);
nmaxhalf =ceil(nmax/2);

for n = 1:nmaxhalf-1,
	newy = zero(laf);		
	
	q = 1;
	sumQ2q = zero(laf);
	while q <= n
		Q_2q = zero(laf);		
		k = 1;
		while k<=q, % loop over k
	    	psum = zero(laf); % inner sum
			lq = firstpartition(2*q,2*k);
			while ~(all(lq==0)), % loop over all partitions
				comm = b(2*(n-q)+1); % build commutator
				for j = length(lq):-1:1,
					comm = [b(lq(j)),comm];
				end;
				psum = psum+comm;
				lq = nextpartition(lq);
	    	end;
			Q_2q = Q_2q+psum*(1/(prod(1:2*k+1)));
			k = k+1;
    	end;
		sumQ2q = sumQ2q +(2*(n-q)+1)*Q_2q;
		q = q+1;
	end
	
	newy = newy-2*sumQ2q;
	
 	m=1;
 	T1 = zero(laf);
 	while m <=n 
 		comm = b(2*(n-m)+1);
 		for j = 1:2*m
 			comm = [Z, comm];
 		end
 		T1 = T1 + (2*(n-m)+1)/prod(1:2*m)*comm;
 		m=m+1;	
  	end	

	newy = newy-T1;
	
	T3 = zero(laf);
	l=1;
	while l <= n,
		psum = zero(laf);
		ll = firstpartition(2*n, 2*l);
		while ~(all(ll==0)),
			comm = W;
			for j = length(ll):-1:1,
				comm = [b(ll(j)),comm];
			end;
			psum = psum+comm;
			ll = nextpartition(ll);
		end;
		T3 = T3+psum*(1/prod(1:2*l));
		l =l+1;
	end
	
	newy = newy- T3;
	
	T2 = zero(laf);
	
	psum = zero(laf);
	for p = 0:2*(n-1),
		msum = zero(laf);
		for m = 0:2*n-p-2,
			ksum = zero(laf);
			for k = 1:p+1,
				jsum = zero(laf);
				js = firstpartition(p+1,k);
				while ~(all(js==0)),
			        comm = b(m+1);
					for ic = length(js):-1:1,
						comm = [b(js(ic)), comm];
					end;
					jsum = jsum + comm;
					js = nextpartition(js);
				end;
				jsum = jsum *(1/prod(1:k+1));
				ksum = ksum+jsum;
			end;
			for i=1:2*n-p-m-1,
				ksum = [Z,ksum];
			end;
			msum = msum + (-1)^(2*n-p-m-1)*(m+1)/prod(1:2*n-p-m-1)*ksum;
		end;
		psum = psum+msum;
	end;
	
	T2 = psum;
	newy = newy - T2;	
		
		
	b(2*n+1) = newy*(1/(2*n+1)/2);
	b(2*n+2)= zero(laf);
end;
b = b(1:nmax);


