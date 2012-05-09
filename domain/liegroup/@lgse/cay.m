function [v] = cay(lgr,a)
% CAY - Computes the Cayley transform of objects in LASE.
% function [v] = cay(lgr,a)

% WRITTEN BY       : Kenth Engø, 1998.02.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if ~isa(a,'lase'),
    error('Second input argument is not of class: lase');
  end;
end;

sh = getshape(a);
v = lgse(sh);
data = getmatrix(a);
mat = (eye(sh)+0.5*data{1})*inv(eye(sh)-0.5*data{1});
vec = 0.5*(mat + eye(sh))*data{2};
setmatrix(v,{mat vec})
return;
