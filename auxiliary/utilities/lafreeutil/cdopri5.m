function [sigma,V,u] = cdopri5()
% classical dopri5(mk) of order 5.
fl = flow;
% get RK method
[RKa,RKb,RKc,RKns,RKord,RKtype,RKbhat,RKname]=setmethod(fl,'dopri5');
% weigted free lie algebra
laf = lafree({[6,5],[1,2,3,3,4,4]});
V = [1 0 0 0 0 0;
     -1 1 0 0 0 0 ;
     1/2 -3/2 1 0 0 0 ;
     0 5 -6 1 0 0 ;
     -53/243 0 128/243 -106/81 1 0;
     0 0 -4/53 7/4 -567/212 1];
Vi = inv(V);
k = zeros(laf,RKns);
for i = 1:RKns,
for j = 1:RKns,
   k(i) = k(i) + Vi(i,j)*basis(laf,j);
end;
end;
u = zeros(laf,RKns);
ktild = u;
ktild(1) = k(1);
for i = 2:RKns,
   for j = 1:i-1,
      u(i) = u(i) + RKa(i,j)*ktild(j);
   end;
   ktild(i) = dexpinv(u(i),k(i),RKord-1);
end;
sigma = zero(laf);
for i = 1:4,
    sigma = sigma+RKb(i)*ktild(i);
end;
return;