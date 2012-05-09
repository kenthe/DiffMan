function [w] = removeps(v),
% REMOVEPS - Diffman: LIEALGEBRA class LAFREE private function
%            Remove components that are relatively very close to 0.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Eng¯, 1997.11.12

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

w = v;
vec = w.weights;
m = max(abs(vec));
vec(find(abs(vec)<5*eps*m)) = 0;
w.weights = vec;
return;
