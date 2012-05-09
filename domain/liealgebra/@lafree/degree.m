function [d] = degree(a)
% DEGREE - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
if isempty(a.weights),
  error('Object has no data!');
end;
ipos = find(a.weights)';
if isempty(ipos),
  d = 0;
else,
  d = max(LAFREEDATA(getlafdata(a)).basdegree(ipos));
end;
