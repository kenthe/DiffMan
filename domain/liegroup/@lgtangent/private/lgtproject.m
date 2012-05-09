%-*-text-*-
function [c] = lgtproject(sh,m)
% LGTPROJECT - Projection onto data of LGTANGENT objects. 
% function [c] = lgtproject(sh,m)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgtangent'),
  obj = lgtangent;
  setshape(obj,sh{2});
elseif strcmp(sh{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
elseif strcmp(sh{1},'lgdirprod'),
  obj = lgdirprod;
  setshape(obj,sh);
else, % Matrix Lie group data.
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
end;
c = {project(obj,m{1}) project(liealgebra(obj),m{2})};
return;
