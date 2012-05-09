%-*-text-*-
function [dim] = latdimension(sh)
% LATDIMENSION - Dimension.
% function [dim] = latdimension(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'ladirprod'),
  obj = ladirprod;
  setshape(obj,sh{2});
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
elseif strcmp(sh{1},'latangent')
  obj = latangent;
  setshape(obj,sh{2});
else,
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
end;
dim = 2*dimension(obj);
return;

