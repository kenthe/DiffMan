function [] = dmex2()
% DMEX2 - DiffMan example # 2.
%
% DMEX2:           Solution of the Lorenz equations in R^3
% DOMAIN:          hmlie(lgrn(3))
% ACTION:          Vector addition
% GENERATOR MAP:   'vfex2'
% EQUATION TYPE:   'General'

clc
disp(' ');
disp('DMEX2:           Solution of the Lorenz equations in R^3');
disp('DOMAIN:          hmlie(lgrn(3))');
disp('ACTION:          Vector addition');
disp('GENERATOR MAP:   ''vfex2''');
disp('EQUATION TYPE:   ''General''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmlie(lgrn(3));
setdata(y,[25;0;-20]);
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex2');
vf
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #3: Construct a timestepper object:');
disp(' ');
ts = tsrkmk;
ts
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #4: Construct a flow object: ');
disp(' ');
f = flow;
setvectorfield(f,vf);
f
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #5: Solve the ODE: ');
disp(' ');
disp('icur = f(y,0,5,0.02);');
icur = f(y,0,5,0.02);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting the solution.');
a = getdata(icur.y);
t = icur.t;
a = reshape(a,3,length(t));
plot3(a(1,:),a(2,:),a(3,:));
axis square
disp('Done.');
disp(' ');
return;



