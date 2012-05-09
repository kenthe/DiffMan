function [w] = mtimes(u,v)
% MTIMES - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;
if length(u) ~= length(v),
	error('Non-matching length of input arguments');
end;

l = length(u);
if isa(u,'lafree'),
	w = u(1);
	ww = w.weights;
   ww = ww*v(1);
   for i = 2:l,
   	ww = ww + (u(i).weights)*v(i);
   end;
else,
   w = v(1);
	ww = w.weights;
   ww = ww*u(1);
   for i = 2:l,
   	ww = ww + (v(i).weights)*u(i);
   end;
end;
w.weights = ww;
w = removeps(w);
w.commtab = [];
return;
