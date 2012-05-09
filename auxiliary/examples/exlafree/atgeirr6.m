function [sig] = atgeirr6();
% sigma of atgeirrs thesis for 6. order Magnus
q = 6;
laf = lafree;
setshape(laf,{[3,q]});
k1 = basis(laf,1);
k2 = basis(laf,2);
k3 = basis(laf,3);
k12 = [k1,k2];
k13 = [k1,k3];
k23 = [k2,k3];
s1 = (1/18)*(5*k1+8*k2+5*k3);
s2 = -(sqrt(15)/108)*(2*k12 + k13 + 2*k23);
s3 = (1/432)*([(k1-5*k3),k12] + [(5*k1-k3),k23]);
s4 = (sqrt(15)/2160)*[k1,[k3,k13]];
sig = s1+s2+s3+s4;