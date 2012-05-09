function [vec] = unskew(u)
% UNSKEW - Converts a skew matrix into a 3-vector.

% Kenth Engø, 2000.08.20

if (norm(u+u') < 1000*eps)&(size(u,1)==3)&(size(u,2)==3),
  vec = [-u(2,3); u(1,3); -u(1,2)];
else
  error('Input matrix is not a 3x3 skew matrix');
end; 
return;
