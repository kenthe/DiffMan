%-*-text-*-
function [c] = lgtlog(dat,sh)
% LGTLOG - Logarithm of LGDIRPROD object.
% function [c] = lgtlog(dat,sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgtangent'),
  error('Do not know how to treat the ''lgtangent'' case yet.');
elseif strcmp(sh{1},'lgdirprod'),
  error('Do not know how to treat the ''lgdirprod'' case yet.');
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
    dat1 = logm(dat{1});
    c = {logm(dat{1}) dexpinv(dat1,dat{2})};
    return;
  else,
    error(['Don''t know how to calculate logarithm of ' class(obj)]);
  end;    
end;
return;

function [v] = dexpinv(a,b)
% Aux. func. based on @liealgebra/dexpinv.m
% Implemented up to order 12 in the commutators.
v = b;
c = a*b-b*a; v = v - 1/2*c;
c = a*c-c*a; v = v + 1/12*c;
c = a*(a*c-c*a)-(a*c-c*a)*a; v = v - 1/720*c;
c = a*(a*c-c*a)-(a*c-c*a)*a; v = v + 1/30240*c;
c = a*(a*c-c*a)-(a*c-c*a)*a; v = v - 1/1209600*c;   % Order 10
c = a*(a*c-c*a)-(a*c-c*a)*a; v = v + 5/239500800*c; % Order 12
return;