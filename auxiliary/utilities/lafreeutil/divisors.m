function [div] = divisors(n)
% DIVISORS - alldivisors of an integer
% [div] = divisors(n)

% written by: Hans Munthe-Kaas, 27/10/97
% last modified: Kenth Engø-Monsen, 2012.04.24

div = [];
for i = 1:n,
	if dmisinteger(n/i),
		div = [div i];
	end;
end;
return;
