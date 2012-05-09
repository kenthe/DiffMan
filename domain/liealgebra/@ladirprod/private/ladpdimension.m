function [dim] = ladpdimension(sh)
% LADPDIMENSION - Dimension - Recursive function.
% function [dim] = ladpdimension(sh)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

dim = 0;
n = size(sh{2},1);
for i = 1:n,
  if strcmp(sh{2}{i,1},'ladirprod')|strcmp(sh{2}{i,1},'lasemprod')|strcmp(sh{2}{i,1},'latangent')
    dimtmp = ladpdimension(sh{2}(i,:));
  else,
    dimtmp = dimension(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']));
  end;
  dim = dim + dimtmp;
end;
return;

