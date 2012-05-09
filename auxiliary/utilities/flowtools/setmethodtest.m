%function [out] = setmethodtest()
% Test of the schemes in "setmethod.m"
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
disp(' ==> The purpose is to verify the order of approximation of');
disp(' ==> the schemes in "setmethod.m"');
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

flB = flow; % "Reference" integrator - computes the "exact" solution
ts = tsrkmk;
setcoordinate(ts,'exp');
setmethod(ts,'RK4');
settimestepper(flB,ts);
setvectorfield(flB,vf);

disp('   ==> Defining the initial coordinates and scheme');
disp('   ==> Defining the initial timestepper');
flA = flow;
ts = tsqq;
setcoordinate(ts,'cay');
setmethod(ts,'qq4a');
settimestepper(flA,ts);
setvectorfield(flA,vf);

disp(' ');
disp(' ==> Computing order of approximation....');

dmprogrep on;

%disp(['Scheme: E1'])
%out=ftorder(flA,flB,y);

for i=1000:1001

    % input exact solution to avoid computing it once more - example
    setdefaults(flA,'newexact',0);

    setmethod(ts,i);
    settimestepper(flA,ts);
    scheme=getmethod(ts);
    disp(['Scheme: ' scheme.RKname]);
    out2=ftorder(flA,flB,y,[],[],[],out.exact);

end

disp(' ');
disp(' ==> done');

return;
