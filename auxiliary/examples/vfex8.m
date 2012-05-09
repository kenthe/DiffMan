function [la] = vfex8(t,y)
% VFEX8 - Generator map from RxM to Lie algebra - General type.
%         This is the van der Pol example with 'mu = 15'.

mu = 15;
la = liealgebra(y);
ydat = getdata(y);
dat = [0 1; -1 mu*(1-ydat(1)^2)];
setdata(la,dat);
return;
