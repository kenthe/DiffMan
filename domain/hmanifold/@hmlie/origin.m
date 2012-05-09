function [orig] = origin(a)
% ORIGIN - Returns the 'origin' in the algebra, as a homogeneous object.
% function [orig] = origin(a)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

orig = hmanifold(a);
shobj = a.shape;
if isa(shobj,'liealgebra'),
  datobj = zero(shobj);
elseif isa(shobj,'liegroup'),
  datobj = identity(shobj);
else,
  error('Shape-object of input object is not a correct object!');
end;

orig.data = getdata(datobj);
return;

