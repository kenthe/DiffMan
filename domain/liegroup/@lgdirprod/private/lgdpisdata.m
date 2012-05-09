function [bool] = lgdpisdata(sh,m)
% LGDPISDATA - Isdata - Recursive function.
% function [bool] = lgdpisdata(sh,m)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

bool = 1;
n = size(sh{2},1);
if (length(m) ~= n), bool = 0; return; end;

for i = 1:n,
  if strcmp(sh{2}{i,1},'lgdirprod')|strcmp(sh{2}{i,1},'lgsemprod')|strcmp(sh{2}{i,1},'lgtangent')
    booltmp = lgdpisdata(sh{2}(i,:),m{i});
  else,
    booltmp = isdata(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']),m{i});
  end;
  bool = bool*booltmp;
  if bool == 0,
    return;
  end;    
end;
return;

