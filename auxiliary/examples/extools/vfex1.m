function [la] = vfex1(t,y)
% VFEX1 - Map from RxM to the Lie algebra. This is a Lie type equation. 

if strcmp(class(y),'hmlie'),
  la = liealgebra(y);
  dat = [0 t 1; -t 0 -t^2; -1 t^2 0];
  setdata(la,dat);
else,
  error('input is not of correct type');
end;
return;



 
