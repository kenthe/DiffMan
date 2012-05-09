function [la] = vfex2(t,y)
% VFEX2 - Generator map from RxM to liealgebra. General type.
%
% Remark: This function has a subroutine LORENZEQ.

la = liealgebra(y);
dat = getdata(y);
dat = lorenzeq(t,dat);
setvector(la,dat);
return;

function ydot = lorenzeq(t,y)
% LORENZEQ - Equation of the Lorenz chaotic attractor.
%
%          ydot = lorenzeq(t,y)

sigma = 10.;
rho = 28.;
beta = 8./3.;
A = [ -beta    0     y(2)  
         0  -sigma   sigma 
      -y(2)   rho    -1  ];
ydot = A*y;
return;


 
