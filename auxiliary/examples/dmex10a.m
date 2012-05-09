function [] = dmex10a()
% DMEX10a - DiffMan example # 10a.
%
% DMEX10a:         This is an ODE evolving in SO(3)
% DOMAIN:          hmlie(lgso(3))
% ACTION:          Left multiplication of lgso(3) on itself
% GENERATOR MAP:   'vfex10'
% EQUATION TYPE:   'Linear'
%
% PURPOSE:         Use "ftorder" to verify the order of the solution
%                  of some fer schemes
%
% WARNING:         This routine is very time consuming to run.
clc
disp(' ');
disp('DMEX10a:         This is an ODE evolving in SO(3)');
disp('DOMAIN:          hmlie(lgso(3))');
disp('ACTION:          Left multiplication of lgso(3) on itself.');
disp('GENERATOR MAP:   ''vfex10''');
disp('EQUATION TYPE:   ''Linear''');
disp(' ');
disp('PURPOSE:         Use ''ftorder'' to verify the order of the solution');
disp('                 of some fer schemes');
disp(' ');
disp('WARNING:         This routine is very time consuming to run.');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmlie(lgso(3));
setdata(y,eye(3));
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex10');
seteqntype(vf,'L');
vf
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #3: Construct two timestepper objects:');
disp(' ');
ts = tsfer;
setmethod(ts,'fer6GLR');
tsB = tsrkmk;
setcoordinate(tsB,'exp');
setmethod(tsB,'RK4');
ts
tsB
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #4: Construct two flow objects: ');
disp(' ');
flA = flow;
settimestepper(flA,ts);
setvectorfield(flA,vf);
flB = flow; % "Reference" integrator - computes the "exact" solution
settimestepper(flB,tsB);
setvectorfield(flB,vf);
flA
flB
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Order of the approximation ....:');
disp(' ');
dmprogrep on;
out=ftorder(flA,flB,y);
setdefaults(flA,'newexact',0);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Checks the order of ''fer2a'':');
setmethod(ts,'fer2a');                        % OK: Global order 2
settimestepper(flA,ts);
out2=ftorder(flA,flB,y,[],[],[],out.exact);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Checks the order of ''fer4G2'':');
setmethod(ts,'fer4G2');                       % OK: Global order 4
settimestepper(flA,ts);
out2=ftorder(flA,flB,y,[],[],[],out.exact);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Checks the order of ''fer5GR'':');
setmethod(ts,'fer5GR');                       % OK: Global order 5
settimestepper(flA,ts);
out2=ftorder(flA,flB,y,[],[],[],out.exact);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Checks the order of ''fer6G3'':');
setmethod(ts,'fer6G3');                       % OK: Global order 6
settimestepper(flA,ts);
out2=ftorder(flA,flB,y,[],[],[],out.exact);

disp(' ');
disp('Done');
return;
