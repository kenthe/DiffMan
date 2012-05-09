function [la] = vfex3(t,y)
% VFEX3 - Generator map from RxM to liealgebra. Linear type.

la = zero(liealgebra(y));
dat = [0 t^2 -0.4*cos(t); -t^2 0 .1*t; .4*cos(t) -.1*t 0];
setdata(la,dat);
return;



 
