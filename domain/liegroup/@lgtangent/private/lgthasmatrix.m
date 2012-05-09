%-*-text-*-
function [bool] = lgthasmatrix(sh)
% LGTHASMATRIX - Hasmatrix.
% function [bool] = lgthasmatrix(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgdirprod'),
  obj = lgdirprod;
  setshape(obj,sh);
elseif strcmp(sh{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
elseif strcmp(sh{1},'lgtangent'),
  obj = lgtangent;
  setshape(obj,sh{2});
else,
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
end;
bool = hasmatrix(obj);
return;

