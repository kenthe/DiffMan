%-*-text-*-
function [c] = latminus(a,b,sh)
% LATMINUS - Subtraction of two LATANGENT objects. 
% function [c] = latminus(a,b,sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'latangent'),
  error('Do not know how to treat the ''latangent'' case yet.');
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the ''lasemprod'' case yet.');
elseif strcmp(sh{1},'ladirprod'),
  error('Do not know how to treat the ''ladirprod'' case yet.');
else,  % Matrix Lie algebra data.
  c = {a{1}-b{1} a{2}-b{2}};
end;
return;
