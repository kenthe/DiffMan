function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation of LADIRPROD.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

v = 1;
sh = a.shape;
for i = 1:a.n,
  if strcmp(sh{2}{i,1},'ladirprod')|strcmp(sh{2}{i,1},'lasemprod')|strcmp(sh{2}{i,1},'latangent')
    vtmp = ladpisdata(sh{2}(i,:),m{i});
  else,
    vtmp = isdata(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']),m{i});
  end;
  v = v*vtmp;
  if v == 0,
    return;
  end;
end;
return;
