function [la] = vfex5(t,y)
% VFEX5 - Generator map from RxM to liealgebra. Linear type.

la = liealgebra(y);
dat = [0 t -0.4*cos(t); -t 0 .1*t; .4*cos(t) -.1*t 0];
setdata(la,dat);
return;



 
