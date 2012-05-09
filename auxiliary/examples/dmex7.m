function [] = dmex7()
% DMEX7 - DiffMan example # 7.
%
% DMEX7:           Integration of the Airy equation
% DOMAIN:          hmrn(lasl(2))
% ACTION:          lasl(2) x R^2 -> R^2; (v,a) -> exp(v)*a
% GENERATOR MAP:   'vfex7'
% EQUATION TYPE:   'Linear'

clc
disp(' ');
disp('DMEX7:           Integration of the Airy equation');
disp('DOMAIN:          hmrn(lasl(2))');
disp('ACTION:          lasl(2) x R^2 -> R^2; (v,a) -> exp(v)*a');
disp('GENERATOR MAP:   ''vfex7''');
disp('EQUATION TYPE:   ''Linear''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmrn(lasl(2));
setdata(y,[1; 0]);
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex7');
seteqntype(vf,'L');
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
tstart = 0;
tend   = 15;
h = 0.1;
icur = f(y,tstart,tend,h);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting the solution.');

a = getdata(icur.y);
t = icur.t;
a = reshape(a,2,length(t));

% Needs to find the coefficients 'x' of the true Airy-solution:
m =[airy(0,tstart) airy(2,tstart); -airy(1,tstart) -airy(3,tstart)];
x = m\[1;0];

% Computes the 'true' solution:
sol    = x(1)*real(airy(-t)) + x(2)*real(airy(2,-t));
solder = -x(1)*real(airy(1,-t)) - x(2)*real(airy(3,-t));

figure(1);
subplot(3,1,1);
plot(t,a(1,:),'b-',t,a(2,:),'r-');
title('Plot of the two solution components');

subplot(3,1,2);
dif = a(1,:) - sol;
plot(t,dif);
title('Error in the first solution-component');

subplot(3,1,3);
difder = a(2,:) - solder;
plot(t,difder,'r-');
title('Error in the second solution-component');
disp('Done.');
disp(' ');
return;
