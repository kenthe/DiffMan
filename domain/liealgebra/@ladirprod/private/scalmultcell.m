function [c] = scalmultcell(a,const)
% SCALMULTCELL - Multiplies a cell-'tree' by a constant.
% function [c] = scalmultcell(a,const)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

n = length(a);
c = cell(n,1); 
for i = 1:n,
  if iscell(a{i})
    c{i} = scalmultcell(a{i},const);
  else,
      c{i} = a{i}*const;
  end;
end;
return;
