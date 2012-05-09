function [c] = lgdpexp(dat,sh)
% LGDPEXP - Exponential of LGDIRPROD objects. 
% function [c] = lgdpexp(dat,sh)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 2000.03.25

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
    if isabelian(obj),              % Abelian case.
      c = dat;
      return;
    elseif hasmatrix(obj),           % Matrix case.
      c = expm(dat);
      return;
    else,
      error('Don''t know how to calculate exponential of this group');
    end;    
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
    c{i} = lgdpexp(dat{i},sh{2}(i,:));
  end;
end;
return;
