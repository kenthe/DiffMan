function [c] = lgdpproject(sh,m)
% LGDPPROJECT - Project 'lgdirprod'-objects. 
% function [c] = lgdpproject(sh,m)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

n = size(sh{2},1);
if n == 1,           % Matrix Lie group data.
  if strcmp(sh{1},'lgtangent'),
    error('Do not know how to treat the ''lgtangent'' case yet.');
  elseif strcmp(sh{1},'lgsemprod'),
    error('Do not know how to treat the ''lgsemprod'' case yet.');
  else,              % Matrix Lie group data.
    obj = eval([sh{1} '(' int2str(sh{2}) ')']);
    c = project(obj,m);
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
  c{i} = lgdpproject(sh{2}(i,:),m{i});
  end;
end;
return;
