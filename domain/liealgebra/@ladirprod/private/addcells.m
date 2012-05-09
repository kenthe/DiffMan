function [c] = addcells(a,b)
% ADDCELLS - Adds the contents of two cells.
% function [c] = addcells(a,b)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

n = length(a);
c = cell(n,1); 
for i = 1:n,
  if iscell(a{i})
    c{i} = addcells(a{i},b{i});
  else,
      c{i} = a{i} + b{i};
  end;
end;
return;
