function [] = dmex8()
% DMEX8 - DiffMan example # 8.
%
% DMEX8:           Integration of the van der Pol equation
% DOMAIN:          hmrn(lagl(2))
% ACTION:          lagl(2) x R^2 -> R^2; (v,a) -> exp(v)*a
% GENERATOR MAP:   'vfex8'
% EQUATION TYPE:   'General'

clc
disp(' ');
disp('DMEX8:           Integration of the van der Pol equation');
disp('DOMAIN:          hmrn(lagl(2))');
disp('ACTION:          lagl(2) x R^2 -> R^2; (v,a) -> exp(v)*a');
disp('GENERATOR MAP:   ''vfex8''');
disp('EQUATION TYPE:   ''General''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmrn(lagl(2));
setdata(y,[0; 1]);
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex8');
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
settimestepper(f,ts);
setvectorfield(f,vf);
f
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #5: Solve the ODE: ');
disp(' ');
disp('icur = f(y,0,15,0.1);');
icur = f(y,0,15,0.1);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting the solution.');
a = getdata(icur.y);
t = icur.t;
a = reshape(a,2,length(t));

subplot(1,2,1)
plot(t,a(1,:),'y-',t,a(2,:),'b-');
title('Solution of the van der Pol problem');
 
subplot(1,2,2)
plot(a(1,:),a(2,:));
title('The van der Pol problem in the phase plane');
axis equal 
disp('Done.');
disp(' ');
return;




