function [c] = ladpuminus(a,sh)
% LADPUMINUS - Uminus 'ladirprod'-objects. 
% function [c] = ladpuminus(a,sh)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

n = size(sh{2},1);
if n == 1,           % Matrix Lie algebra data.
  if strcmp(sh{1},'latangent'),
    error('Do not know how to treat the ''latangent'' case yet.');
  elseif strcmp(sh{1},'lasemprod'),
    error('Do not know how to treat the ''lasemprod'' case yet.');
  else,              % Matrix Lie algebra data.
    c = -a;
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
    c{i} = ladpuminus(a{i},sh{2}(i,:));
  end;
end;
return;
