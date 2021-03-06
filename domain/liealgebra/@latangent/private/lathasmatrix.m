%-*-text-*-
function [bool] = lathasmatrix(sh)
% LATHASMATRIX - Hasmatrix.
% function [bool] = lathasmatrix(sh)

% WRITTEN BY       : Kenth Eng��, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'ladirprod'),
  obj = ladirprod;
  setshape(obj,sh);
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the ''lasemprod'' case yet.');
elseif strcmp(sh{1},'latangent'),
  obj = latangent;
  setshape(obj,sh{2});
else,
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
end;
bool = hasmatrix(obj);
return;

