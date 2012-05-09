function [v] = exp(lgr,a)
% EXP - Computes the exponential of objects in LASE.
% function [v] = exp(lgr,a)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if ~isa(a,'lase'),
    error('Second input argument is not of class: lase');
  end;
end;

sh = getshape(a);
v = lgse(sh);
if sh == 3,
  m  = getmatrix(a);
  ex = expm([m{1} m{2}; 0 0 0 0]);
  % setmatrix(v,{ex(1:3,1:3) ex(1:3,4)});
  v.data = {ex(1:3,1:3) ex(1:3,4)};
else
  error('Only the case ''shape == 3'' is implemented!');
end;
return;
