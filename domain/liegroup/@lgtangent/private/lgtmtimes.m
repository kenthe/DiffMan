%-*-text-*-
function [c] = lgtmtimes(dat1,dat2,sh)
% LGTMTIMES - Group multiplication of two LGTANTENT objects.
% function [c] = lgtmtimes(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgtangent'),
  a = lgtangent;
  setshape(a,sh);
  setdata(a,dat1{1});
  b = a;
  setdata(b,dat2{1});
  u = liealgebra(a);
  setdata(u,dat1{2});
  v = u;
  setdata(v,dat2{2});
  c{1} = getdata(a*b);
  c{2} = getdata(adjoint(u,inv(b))+v);
elseif strcmp(sh{1},'lgdirprod'),
  a = lgdirprod;
  setshape(a,sh);
  setdata(a,dat1{1});
  b = a;
  setdata(b,dat2{1});
  u = liealgebra(a);
  setdata(u,dat1{2});
  v = u;
  setdata(v,dat2{2});
  c{1} = getdata(a*b);
  c{2} = getdata(adjoint(u,inv(b))+v);
elseif strcmp(sh{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
else,              % Matrix Lie group data.
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
  % This is the grp operation: (a,u)(b,v) = (ab,b^(-1)ub + v).
  if isabelian(obj),
    c = {dat1{1}+dat2{1} dat1{2}+dat2{2}};
  elseif hasmatrix(obj), % Matrix representation.
    c = {dat1{1}*dat2{1} inv(dat2{1})*dat1{2}*dat2{1}+dat2{2}};
  else,  % Vector representation.
    error(['Sorry: Don''t know how to multiply ' class(obj) 'objects']);
  end;
  
  % This is the grp operation: (a,v)(b,u) = (ab,v+u).
  %if hasmatrix(obj), % Matrix representation.
  %  c = {dat1{1}*dat2{1} dat1{2}+dat2{2}};
  %else,  % Vector representation.
  %  c = {dat1{1}+dat2{1} dat1{2}+dat2{2}};
  %end;

end;
return;

