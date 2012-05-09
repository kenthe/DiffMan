%-*-text-*-
function [c] = latuminus(a,sh)
% LATUMINUS - Uniary minus of an LATANGENT object. 
% function [c] = latuminus(a,sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'latangent'),
  error('Do not know how to treat the ''latangent'' case yet.');
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the ''lasemprod'' case yet.');
elseif strcmp(sh{1},'ladirprod'),
  error('Do not know how to treat the ''ladirprod'' case yet.');
else,  % Matrix Lie algebra data.
  c = {-a{1} -a{2}};
end;
return;
