function [j] = sameshape(a,b)
% SAMESHAPE - Checks if 'a' and 'b' have the same shape.
% function [j] = sameshape(a,b)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK,
  if ~isa(b,'lgdirprod'),
    error('Input is not from ''lgdirprod''-class.');
  end;
end;

sh1 = shapestr(a.shape);
sh2 = shapestr(b.shape);
j = strcmp(sh1,sh2);
return;
