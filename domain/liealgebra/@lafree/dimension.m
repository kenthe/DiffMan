function [d] = dimension(a)
% DIMENSION - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
d = LAFREEDATA(getlafdata(a)).dim;
if isempty(d),
  error('Element has no shape information');
end;
