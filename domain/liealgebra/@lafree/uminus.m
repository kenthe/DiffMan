function [w] = uminus(u)
% UMINUS - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

w = u;
w.weights = -w.weights;
w.commtab = [];
return;
