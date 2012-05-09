%-*-text-*-
function [c] = latzero(sh)
% LATZERO - Zero of LATANGENT-objects. 
% function [c] = latzero(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'latangent'),
  obj = latangent;
  setshape(obj,sh{2});
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the ''lasemprod'' case yet.');
elseif strcmp(sh{1},'ladirprod'),
  obj = ladirprod;
  setshape(obj,sh);
else, % Matrix Lie group data.
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
end;
ans = getdata(zero(obj));
c = {ans ans};
return;
