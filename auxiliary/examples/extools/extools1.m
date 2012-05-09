function [out] = dmextools1()
% Test of "ftorder"
%
% DiffMan must be initalized.
% >> pwd
% ..../DiffMan
% >> dminit
% ....  
% >> dmextools1

disp(' ');
disp(' ==> PROBLEM EVOLVING IN LGSO! <==');
disp(' ');
disp(' ==> This example program integrates an equation in SO(3)');
disp(' ==> The purpose is to demonstrate the use of the flowtools');
disp(' ==> routine "ftorder", that computes order of approximation');
disp(' ==> of a given integrator and scheme');
disp(' ');
disp('   ==> Defining the inital object');
y = hmlie;
sh = lgso(3);
setshape(y,sh);
setdata(y,eye(3));

disp('   ==> Defining the vector field');
vf = vectorfield(y);
setfm2g(vf,'vfex1');
seteqntype(vf,'L');

disp('   ==> Defining the coordinates and scheme');
disp('   ==> Defining the timestepper');
flA = flow;
ts = tsrkmk;
setcoordinate(ts,'pade22');
setmethod(ts,'RKF34');
settimestepper(flA,ts);
setvectorfield(flA,vf);

flB = flow; % "Reference" integrator - computes the "exact" solution
ts = tsrkmk;
setcoordinate(ts,'exp');
setmethod(ts,'RK4');
settimestepper(flB,ts);
setvectorfield(flB,vf);

disp(' ');
disp(' ==> Computing order of approximation....');

dmprogrep on;

out=ftorder(flA,flB,y);

hold off
loglog(out.step,out.gerr,'r');
hold on
loglog(out.step,out.lerr,'g--');
xlabel('stepsize');
ylabel('global error');

% input exact solution to avoid computing it once more - example
setdefaults(flA,'newexact',0);
out2=ftorder(flA,flB,y,[],[],[],out.exact);

disp(' ');
disp(' ==> done');

return;
