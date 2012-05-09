function [c] = ladphorzcat(a,b,sh)
% LADPHORZCAT - Commutator between two 'ladirprod'-objects. 
% function [c] = ladphorzcat(a,b,sh)

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
    if isabelian(obj),           % Abelian algebra.
      c = zeros(size(a));
    elseif hasmatrix(obj),       % Non-abelian algebra/matrix rep.
      c = a*b - b*a;
    else
      error('Don''t know how to calculate this commutator.');
    end;
  end;
else,        % composite object
  c = cell(n,1); 
  for i = 1:n,
    c{i} = ladphorzcat(a{i},b{i},sh{2}(i,:));
  end;
end;
return;
