function [c] = lathorzcat(a,b,sh)
% LATHORZCAT - Commutator between two LATANGENT objects. 
% function [c] = lathorzcat(a,b,sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'latangent'),
  error('Do not know how to treat the ''latangent'' case yet.');
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the ''lasemprod'' case yet.');
elseif strcmp(sh{1},'ladirprod'),
  error('Do not know how to treat the ''ladirprod'' case yet.');
else,  % Matrix Lie algebra data.
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
  if isabelian(obj),           % Abelian algebra.
    c = {zeros(size(a{1})) zeros(size(a{2}))};
  elseif hasmatrix(obj),       % Non-abelian algebra/matrix rep.
    c = {a{1}*b{1}-b{1}*a{1} a{2}*b{1}-b{1}*a{2}+a{1}*b{2}-b{2}*a{1}};
  else
    error('Don''t know how to calculate this commutator.');
  end;
end;
return;
