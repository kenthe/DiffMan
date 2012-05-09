function [w] = minus(u,v)
% MINUS - Diffman: LIEALGEBRA class LAFREE function MINUS

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

w = zero(u);
w.weights = u.weights-v.weights;
w = removeps(w);
w.commtab = [];
return;
