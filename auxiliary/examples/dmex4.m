function [] = dmex4()
% DMEX4 - DiffMan example # 4.
%
% DMEX4:           Integration of the rigid body
% DOMAIN:          hmrigid(3)
% ACTION:          Matrix multiplication of lgso(3) on laso(3)* = R^3
% GENERATOR MAP:   'vfex4'
% EQUATION TYPE:   'General'

clc
disp(' ');
disp('DMEX4:           Integration of the rigid body');
disp('DOMAIN:          hmrigid(3)');
disp('ACTION:          Matrix multiplication of lgso(3) on laso(3)* = R^3');
disp('GENERATOR MAP:   ''vfex4''');
disp('EQUATION TYPE:   ''General''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

global INV_INERTIA 
INERTIA     = 1/8*[7 0 0;0 5 0; 0 0 2];
INV_INERTIA = inv(INERTIA);

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmrigid(3);
vec = INERTIA*[1 1 1]';
setdata(y,vec);
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex4');
vf
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #3: Construct a timestepper object:');
disp(' ');
ts = tsrkmk;
method = 'RK4';
coord  = 'exp';
setcoordinate(ts,coord);
setmethod(ts,method);
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
disp('icur = f(y,0,10,0.1);');
step = 0.1;
icur = f(y,0,10,step);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting characteristics of the solution.');
a = getdata(icur.y);
t = icur.t;

n   = length(t)-1;
t   = t(1:n);
ham = zeros(n,1);
hnorm = ham;
pos = zeros(3,n);

for i = 1:n,
  ham(i) = 1/2*a(:,i)'*INV_INERTIA*a(:,i);
  % The following function is a Casimir:
  hnorm(i) = a(:,i)'*a(:,i); 
end;

figure(1)
subplot(3,1,1)
plot([t],[ham],'r');
title(['The Hamiltonian calculated with method: ' method ', stepsize h = ' sprintf('%0.5g',step) ', and coordinates: ' coord]);

subplot(3,1,2)
plot(t,ham-ham(1),'k')
title('Black: Error in Hamiltonian');

subplot(3,1,3)
plot(t,hnorm-hnorm(1),'g')
title('Green: Error in norm of ang. momentum vector');

disp('Done.');
disp(' ');
return;


