function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation for LGDIRPROD.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

if (length(m) ~= a.n), v = 0; return; end;
if iscellempty(m), v = 1; return; end;

v = 1;
sh = a.shape;
for i = 1:a.n,
  if strcmp(sh{2}{i,1},'lgdirprod')|strcmp(sh{2}{i,1},'lgsemprod')|strcmp(sh{2}{i,1},'lgtangent')
    vtmp = lgdpisdata(sh{2}(i,:),m{i});
  else,
    vtmp = isdata(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']),m{i});
  end;
  v = v*vtmp;
  if v == 0,
    return;
  end;
end;
return;
