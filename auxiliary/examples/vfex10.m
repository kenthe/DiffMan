function [la] = vfex10(t,y)
% VFEX10 - Generator map from RxM to Lie algebra. Linear type.

la = liealgebra(y);
dat = [0 t 1; -t 0 -t^2; -1 t^2 0];
setdata(la,dat);
return;



 
