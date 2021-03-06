function [dim] = lafdim(n,wghts)
%LAFDIM - dimension graded free Liealgebra
%  function [dim] = lafdim(n,wghts)
%
%  Given the free Liealgebra generated by s symbols [1],...,[s], each
%  with a positive integer weight: wghts(1),...,wghts(s).
%
%  d is the number of commutators in the Hall set that has 
%  weight <= n.
%
%  Example: lafdim(3,[1,2,3]) == 4
%     since the commutators of weight up to 3 are:
%     1: [1],
%     2: [2],
%     3: [1,2] and [3].
%
%  See also: lafcount.

% written by: Hans Munthe-Kaas, 27/10/97.
% last modified: Kenth Eng�-Monsen, 2012.04.24

if any(wghts)<1,
	error('weights must be positive integers');
end;
if ~all(dmisinteger(wghts)),
	error('weights must be positive integers');
end;
% compute roots of characteristic polynomial
pdeg = max(wghts);
pol = zeros(1,pdeg+1);
for i = 1:length(wghts),
	pos = pdeg-wghts(i)+1;
	pol(pos) = pol(pos)-1;
end;
pol(pdeg+1) = 1;
lambs = roots(pol);
% plug into formula
dim = 0;
for q = 1:n,
	nu = 0;
	for d = divisors(q),
		a = sum(lambs.^(-q/d));
		nu = nu + a*mobius(d);
	end;
	nu = nu/q;
	nu = round(nu);
	dim = dim + nu;
end;
return;
