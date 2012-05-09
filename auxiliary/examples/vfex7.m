function [la] = vfex7(t,y)
% VFEX7 - Generator map from RxM to liealgebra. Linear type.

la = liealgebra(getshape(y));
dat = [0 1; -t 0];
setdata(la,dat);
return;



 
