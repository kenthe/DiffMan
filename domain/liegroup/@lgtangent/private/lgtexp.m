%-*-text-*-
function [c] = lgtexp(dat,sh)
% LGTEXP - Exponential of LGTANGENT objects. 
% function [c] = lgtexp(dat,sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgtangent'),
  error('Do not know how to treat the ''lgtangent'' case yet.');
elseif strcmp(sh{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
elseif strcmp(sh{1},'lgdirprod'),
  error('Do not know how to treat the ''lgdirprod'' case yet.');
else, % Matrix Lie group data.
  if ~isempty(sh{2}),
    obj = eval([sh{1} '(' int2str(sh{2}) ')']);
  else,
    obj = eval(sh{1});
  end;
  if isabelian(obj),              % Abelian case.
    c = dat;
    return;
  elseif hasmatrix(obj),           % Matrix case.
    c = {expm(dat{1}) dexp(dat{1},dat{2})};
    return;
  else,
    error('Don''t know how to calculate exponential of this group');
  end;    
end;
return;

function [v] = dexp(a,b)
% Aux. func. based on @liealgebra/dexp.m
% Implemented up to order 12 in the commutators.
v = b;
c = a*b-b*a; v = v + 1/2*c;
c = a*c-c*a; v = v + 1/6*c; 
c = a*c-c*a; v = v + 1/24*c;
c = a*c-c*a; v = v + 1/120*c;
c = a*c-c*a; v = v + 1/720*c; 
c = a*c-c*a; v = v + 1/5040*c; 
c = a*c-c*a; v = v + 1/40320*c; 
c = a*c-c*a; v = v + 1/362880*c; 
c = a*c-c*a; v = v + 1/3628800*c;    % Order 9
c = a*c-c*a; v = v + 1/39916800*c;   % Order 10
c = a*c-c*a; v = v + 1/479001600*c;  % Order 11
c = a*c-c*a; v = v + 1/(13*479001600)*c; % Order 12
return;