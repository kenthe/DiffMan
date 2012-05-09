function [sigma,V,u] = rkmk4()
% classical rkmk of order 4.
fl = flow;
% get RK method
[RKa,RKb,RKc,RKns,RKord,RKtype,RKbhat,RKname]=setmethod(fl,'RK4');
% weigted free lie algebra
laf = lafree({[4,4],[1,2,3,3]});
V = [1  0  0  0
    -1  1  0  0
     0 -1  1  0
     1  0 -2  1];
Vi = inv(V);
k = zeros(laf,4);
for i = 1:4,
for j = 1:4,
   k(i) = k(i) + Vi(i,j)*basis(laf,j);
end;
end;
u = zeros(laf,4);
ktild = u;
ktild(1) = k(1);
for i = 2:4,
   for j = 1:i-1,
      u(i) = u(i) + RKa(i,j)*ktild(j);
   end;
   ktild(i) = dexpinv(u(i),k(i),4);
end;
sigma = zero(laf);
for i = 1:4,
    sigma = sigma+RKb(i)*ktild(i);
end;
return;