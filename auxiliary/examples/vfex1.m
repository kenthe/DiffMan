function [la] = vfex1(t,y)
% VFEX1 - Generator map from RxM to the Lie algebra. Linear type.

la = liealgebra(y);
dat = [0 t 1; -t 0 -t^2; -1 t^2 0];
setdata(la,dat);
return;



 
