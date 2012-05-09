function [la] = vfparticle(t,y)
yv = getdata(y);
b = dipol(yv(1:3));
v = yv(4:6);
a = -cross(v,b);
yprime = [v ; a];
la = liealgebra(getshape(y));
setdata(la,yprime);
% fprintf('t= %f r = %f\n',t,norm(y(1:3),2));
return;

function [b] = dipol(x);
[az,el,r] = cart2sph(x(1),x(2),x(3));
br = 2*sin(el)/(r^3);
[br1,br2,br3] = sph2cart(az,el,br);
btheta = cos(el)/(r^3);
[bth1,bth2,bth3] = sph2cart(az,el-pi/2,btheta);
b = [br1+bth1,br2+bth2,br3+bth3]';
return;
