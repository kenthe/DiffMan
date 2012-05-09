%-*-text-*-
function [c] = lgtlog(dat,sh)
% LGTLOG - Log of 'lgdirprod'-objects - Recursive function.
% function [c] = lgtlog(dat,sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

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
    if isabelian(obj),              % Abelian case.
      c = dat;
      return;
    elseif hasmatrix(obj),           % Matrix case.
      c = logm(dat);
      return;
    else,
      error(['Don''t know how to calculate logarithm of ' class(obj)]);
    end;    
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
    c{i} = lgtlog(dat{i},sh{2}(i,:));
  end;
end;
return;
