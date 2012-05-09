function [v] = isabelian(a)
% ISABELIAN - Checks if LADIRPROD is Abelian.
% function [v] = isabelian(a)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

v = 1;
sh = a.shape;
for i = 1:a.n,
  if strcmp(sh{2}{i,1},'ladirprod')|strcmp(sh{2}{i,1},'lasemprod')|strcmp(sh{2}{i,1},'latangent')
    vtmp = ladpisabelian(sh{2}(i,:));
  else,
    vtmp = isabelian(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']));
  end;
  v = v*vtmp;
  if v == 0,
    return;
  end;
end;
return;
