function [j] = sameshape(a,b)
% SAMESHAPE - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Eng¯, 1997.11.12

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

if ~strcmp(class(a),class(b)),
   j = 0;
   return;
end;
da = getlafdata(a);
db = getlafdata(b);
if isempty(da) | isempty(db),
   j = 0;
end;
global LAFREEDATA;
j = eqshape(LAFREEDATA(da).shape,LAFREEDATA(db).shape);
return;
