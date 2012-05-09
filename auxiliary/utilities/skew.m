function [u] = skew(a)
% SKEW - Creates a skew matrix from the 3-vector A.

% Kenth Engø, 1998.02.02

if (length(a) == 3),
  u = [0 -a(3) a(2); a(3) 0 -a(1); -a(2) a(1) 0];
else
  error('Input vector is not of length 3');
end; 
return;