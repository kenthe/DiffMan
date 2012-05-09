function [la] = vfex9(t,y)
% VFEX9 - Generator map from RxM to liealgebra. General type.

global INV_INERTIA MASS LENGTH GRAVITY COG_VECTOR

la = lase(3);
ydat = getdata(y); 
dat1 = -INV_INERTIA*ydat{1};
dat2 = -MASS*LENGTH*GRAVITY*COG_VECTOR;
setvector(la,{dat1 dat2});
return;
