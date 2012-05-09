function z = zero(lalg)
% ZERO - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

if isempty(getshape(lalg)),
  error('Algebra has no shape!');
end;
z = lalg;
z.weights = sparse(dimension(lalg),1);
z.commtab = [];

return;
