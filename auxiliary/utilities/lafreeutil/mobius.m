function [m] = mobius(n)
% MOBIUS - mo"bius number theoretic mu function

% Written by: Hans Munthe-Kaas, 27/10/97
if n<1, error('Function is undefined'); end;
if n==1, m = 1; return; end;
f = factor(n);
if any(f(1:length(f)-1)==f(2:length(f))),
	m = 0;
	return;
end;
m = (-1)^length(f);
return;
