%-*-text-*-
function [c] = lgtinv(dat,sh)
% LGTINV - Group inverse of LGTANTENT object.
% function [c] = lgtinv(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

if strcmp(sh{1},'lgtangent'),
  g = lgtangent;
  setshape(g,sh);
  setdata(g,dat{1});
  u = liealgebra(g);
  setdata(u,dat{2});
  c{1} = getdata(inv(g));
  c{2} = getdata(-adjoint(u,g));
elseif strcmp(sh{1},'lgdirprod'),
  g = lgdirprod;
  setshape(g,sh);
  setdata(g,dat{1});
  u = liealgebra(g);
  setdata(u,dat{2});
  c{1} = getdata(inv(g));
  c{2} = getdata(-adjoint(u,g));
elseif strcmp(sh{1},'lgsemprod'),
  error('Do not know how to treat the ''lgsemprod'' case yet.');
else, % Matrix Lie group data.
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
  % This is the inverse grp operation: inv(a,u) = (a^(-1),-aua^(-1)).
  if hasmatrix(obj), % Matrix representation.
    c = {inv(dat{1}) -dat{1}*dat{2}*inv(dat{1})};
  else,  % Vector representation.
    c = {-dat{1} -dat{2}};
  end;
end;
return;

