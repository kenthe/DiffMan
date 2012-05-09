function [c] = ladpproject(sh,m)
% LADPPROJECT - Project 'ladirprod'-objects. 
% function [c] = ladpproject(sh,m)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

n = size(sh{2},1);
if n == 1,           % Matrix Lie algebra data.
  if strcmp(sh{1},'latangent'),
    error('Do not know how to treat the ''latangent'' case yet.');
  elseif strcmp(sh{1},'lasemprod'),
    error('Do not know how to treat the ''lasemprod'' case yet.');
  else,              % Matrix Lie algebra data.
    obj = eval([sh{1} '(' int2str(sh{2}) ')']);
    c = project(obj,m);
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
  c{i} = ladpproject(sh{2}(i,:),m{i});
  end;
end;
return;
