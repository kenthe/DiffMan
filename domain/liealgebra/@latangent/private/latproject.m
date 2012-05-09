%-*-text-*-
function [c] = latproject(sh,m)
% LATPROJECT - Projection onto data of LATANGENT objects. 
% function [c] = latproject(sh,m)

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
c = {project(obj,m{1}) project(liealgebra(obj),m{2})};
return;
