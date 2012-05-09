function [d] = getdegree(a)
% GETDEGREE - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1998 July.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
d = LAFREEDATA(getlafdata(a)).basdegree';

