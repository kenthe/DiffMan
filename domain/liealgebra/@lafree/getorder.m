function [d] = getorder(a)
% GETORDER - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1998 July.
% LAST MODIFIED BY : None.

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
d = LAFREEDATA(getlafdata(a)).basorder';

