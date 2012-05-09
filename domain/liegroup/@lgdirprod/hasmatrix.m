function [v] = hasmatrix(a)
% HASMATRIX - Checks if LGDIRPROD has a matrix representation.
% function [v] = hasmatrix(a)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

v = 1;
sh = a.shape;
for i = 1:a.n,
  if strcmp(sh{2}{i,1},'lgdirprod')|strcmp(sh{2}{i,1},'lgsemprod')|strcmp(sh{2}{i,1},'lgtangent')
    vtmp = lgdphasmatrix(sh{2}(i,:));
  else,
    vtmp = hasmatrix(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']));
  end;
  v = v*vtmp;
  if v == 0,
    return;
  end;
end;
return;

