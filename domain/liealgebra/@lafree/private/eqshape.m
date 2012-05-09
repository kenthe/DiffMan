function [yn] = eqshape(sh1,sh2)
% EQSHAPE - Diffman: LIEALGEBRA class LAFREE private function
%           Are two shapes equal?

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Eng¯, 1997.11.12

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

v1 = sh1{1};
v2 = sh2{1};
if ~all(v1==v2),
   yn = 0;
   return;
end;
v1 = sh1{2};
v2 = sh2{2};
if ~all(v1==v2),
   yn = 0;
   return;
end;
yn = 1;
return;
