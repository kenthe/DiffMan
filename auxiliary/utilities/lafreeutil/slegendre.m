function [pn] = slegendre(n)
% SLEGENDRE - shifted legendre polynomial of order n
%
% function [p] = slegendre(n)
%
% Legendre polynomials normalized to [0 1], see Handbook of math func. p782.

% written by Hans Munthe-Kaas , october 1997
pnm1 = [];
pn = [1];
for i = 0:n-1,
	a1n = i+1;
	a2n = -2*i-1;
	a3n = 4*i+2;
	a4n = i;
	pnp1 = a2n*[0 pn]+a3n*[pn 0] - a4n*[0 0 pnm1];
	pnp1 = pnp1/a1n;
	pnm1 = pn;
	pn = pnp1;
end;
