function [bool] = ladpisabelian(sh)
% LADPISABELIAN - Isabelian - Recursive function.
% function [bool] = ladpisabelian(sh)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

bool = 1;
n = size(sh{2},1);
for i = 1:n,
  if strcmp(sh{2}{i,1},'ladirprod')|strcmp(sh{2}{i,1},'lasemprod')|strcmp(sh{2}{i,1},'latangent')
    booltmp = ladpisabelian(sh{2}(i,:));
  else,
    booltmp = isabelian(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']));
  end;
  bool = bool*booltmp;
  if bool == 0,
    return;
  end;    
end;
return;

