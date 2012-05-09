%-*-text-*-
function [c] = lgtidentity(sh)
% LGTIDENTITY - Identity of LGTANGENT-objects -- Recursive function. 
% function [c] = lgtidentity(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgtangent'),
  ctmp = lgtidentity(sh{2});
  c = {ctmp {ctmp{2} ctmp{2}}};
elseif strcmp(sh{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
elseif strcmp(sh{1},'lgdirprod'),
  n = size(sh{2},1);
  c = {cell(n,1) cell(n,1)};
  for i = 1:n,
    ctmp = lgtidentity(sh{2}(i,:));
    c{1}{i} = ctmp{1};
    c{2}{i} = ctmp{2};
  end;
else, % Matrix Lie group data.
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
  c = {getdata(identity(obj)) getdata(zero(liealgebra(obj)))};
end;
return;
