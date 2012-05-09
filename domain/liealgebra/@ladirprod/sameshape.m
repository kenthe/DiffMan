function [j] = sameshape(a,b)
% SAMESHAPE - Checks if 'a' and 'b' have the same shape.
% function [j] = sameshape(a,b)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.04.11

global DMARGCHK

if DMARGCHK,
  if ~isa(b,'ladirprod'),
    error('Input is not from ''ladirprod''-class.');
  end;
end;

sh1 = shapestr(a(1).shape);
sh2 = shapestr(b(1).shape);
j = strcmp(sh1,sh2);
return;
