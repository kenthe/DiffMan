function [c] = horzcat(a,b)
% HORZCAT - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

if ~sameshape(a,b),
  error('Arguments are not in same algebra!');
end;
c = zero(a);
id = getlafdata(c);
for i = find(a.weights)',
for j = find(b.weights)',
  c.weights = c.weights + a.weights(i)*b.weights(j)*bascomm(id,i,j);
end;
end;
c = removeps(c);
c.commtab = [];
return;
