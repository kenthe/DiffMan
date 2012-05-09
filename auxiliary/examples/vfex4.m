function [la] = vfex4(t,y)
% VFEX4 - Generator map from RxM to liealgebra. General type.

global INV_INERTIA

la   = laso(3);
ydat = getdata(y);
dat  = -INV_INERTIA*ydat;
setvector(la,dat);
return;
