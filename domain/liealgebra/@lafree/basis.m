function [v] = basis(a,i)
% BASIS - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998 Nov.

if (nargin > 2)|(nargin < 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

if isempty(a.shape),
   error('No shape is defined');
end;
v = zero(a);
v.weights(i) = 1;
return;
