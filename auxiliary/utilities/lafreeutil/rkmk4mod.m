function [sigmat,V,ut] = rkmk4mod()
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
ut = u;
i1 = k(1);
i2 = 2*(k(2)-i1)+2*(k(3)-i1)-(k(4)-i1);
u(2) = RKa(2,1)*k(1);
ut(2) = u(2) - (1/12)*[i1,u(2)];
%ut(2)= u(2) - (1/8)*[i1,u(2)] - (1/96)*[i2,u(2)];
u(3) = RKa(3,1)*k(1) + RKa(3,2)*k(2);
ut(3) = u(3) - (1/12)*[i1,u(3)];
%ut(3)= u(3) - (1/8)*[i1,u(3)] - (1/96)*[i2,u(3)];
u(4) = RKa(4,1)*k(4) + RKa(4,2)*k(2)+ RKa(4,3)*k(3);
ut(4) = u(4) - (1/6)*[i1,u(4)];
%ut(4)= u(4) - (1/4)*[i1,u(4)] - (1/24)*[i2,u(4)];

sigma = zero(laf);
for i = 1:4,
    sigma = sigma+RKb(i)*k(i);
end;
sigmat = sigma-(1/4)*[i1,sigma]-(1/24)*[i2,sigma];
return;