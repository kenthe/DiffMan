function [bool] = ladpisdata(sh,m)
% LADPISDATA - Isdata - Recursive function.
% function [bool] = ladpisdata(sh,m)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

bool = 1;
n = size(sh{2},1);
for i = 1:n,
  if strcmp(sh{2}{i,1},'ladirprod')|strcmp(sh{2}{i,1},'lasemprod')|strcmp(sh{2}{i,1},'latangent')
    booltmp = ladpisdata(sh{2}(i,:),m{i});
  else,
    booltmp = isdata(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']),m{i});
  end;
  bool = bool*booltmp;
  if bool == 0,
    return;
  end;    
end;
return;

