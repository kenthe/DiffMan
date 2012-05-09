function [s] = getnumberfield(u)
% GETNUMBERFIELD - Returns the number field.
% function [s] = getnumberfield(u)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(u.shape{1},'lgtangent'),
  obj = lgtangent;
  setshape(obj,u.shape);
elseif strcmp(u.shape{1},'lgdirprod'),
  obj = lgdirprod;
  setshape(g,u.shape);
elseif strcmp(u.shape{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
else, % Matrix Lie group data.
  obj = eval([u.shape{1} '(' int2str(u.shape{2}) ')']);
end;
s = getnumberfield(obj);
return;
