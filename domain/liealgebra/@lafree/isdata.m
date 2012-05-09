function [b] = isdata(a,v)
% ISDATA - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Eng¯, 1997.11.12

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

if length(v)>dimension(a),
   b = 0;
   return;
end;
if ~isa(v,'double'),
   b = 0;
   return;
end;
if min(size(v)) ~=1,
   b=0;
   return;
end;
b=1;
return;
