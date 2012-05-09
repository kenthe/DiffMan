function [la] = vfex6(t,y)
% VFEX6 - Generator map from RxM to liealgebra. General type.

la  = liealgebra(y);
mat = getdata(y);
dat = tril(mat,0) - triu(mat,0);
setdata(la,dat);
return;



 
