function [la] = vfmagpart(t,y)
% magpart - particle in mag. field

la = liealgebra(getshape(y));
yv = getdata(y);
b = dipol(yv(1:3));
bh = hat(b);
lamat = [zeros(3,3) eye(3);
         zeros(3,3) hat(b)];
setdata(la,lamat);
return;

function [b] = dipol(x);
% returnerer magnetisk feltvektor i en avstand x fra senteret av en
% magnetisk dipol. (dimensjonsl|se enheter).
% x og b er 3 x 1 vektorer.

% HMK - 94
[az,el,r] = cart2sph(x(1),x(2),x(3));
br = 2*sin(el)/(r^3);
[br1,br2,br3] = sph2cart(az,el,br);
btheta = cos(el)/(r^3);
[bth1,bth2,bth3] = sph2cart(az,el-pi/2,btheta);
b = [br1+bth1,br2+bth2,br3+bth3]';
return;

function vh = hat(v)
% HAT - hatmap from R^3 -> so(3)
vh = zeros(3,3);
vh(1,2) = -v(3);
vh(1,3) = v(2);
vh(2,3) = -v(1);
vh = vh - vh';
return;
