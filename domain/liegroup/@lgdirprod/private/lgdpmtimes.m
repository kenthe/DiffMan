function [c] = lgdpmtimes(a,b,sh)
% LGDPMTIMES - Group multiplication of 'lgdirprod'-objects - Recursive.
% function [c] = lgdpmtimes(a,b,sh)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

n = size(sh{2},1);
if n == 1,           % Matrix Lie group data.
  if strcmp(sh{1},'lgtangent'),
    error('Do not know how to treat the ''lgtangent'' case yet.');
  elseif strcmp(sh{1},'lgsemprod'),
    error('Do not know how to treat the ''lgsemprod'' case yet.');
  else,              % Matrix Lie group data.
    if ~isempty(sh{2}),
      obj = eval([sh{1} '(' int2str(sh{2}) ')']);
    else,
      obj = eval(sh{1});
    end;
    if isabelian(obj),                  % Abelian case. (vector case!)
      c = a + b;
      return;
    elseif hasmatrix(obj),              % Matrix case.
      c = a*b;
      return;
    else,
      error('Don''t know how to treat this case.');
    end;
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
    c{i} = lgdpmtimes(a{i},b{i},sh{2}(i,:));
  end;
end;
return;

