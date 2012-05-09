function [] = dmex9()
% DMEX9 - DiffMan example # 9.
%
% DMEX9:           Integration of the heavy top
% DOMAIN:          hmtop(3)
% ACTION:          Coadjoint action of lgse(3) on lase(3)*
% GENERATOR MAP:   'vfex9'
% EQUATION TYPE:   'General'

clc
disp(' ');
disp('DMEX9:           Integration of the heavy top');
disp('DOMAIN:          hmtop(3)');
disp('ACTION:          Coadjoint action of lgse(3) on lase(3)*');
disp('GENERATOR MAP:   ''vfex9''');
disp('EQUATION TYPE:   ''General''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');

global INERTIA INV_INERTIA MASS LENGTH GRAVITY COG_VECTOR

stop = 5;
start = 0;
step = 0.01;
phi = pi/16;
n = ceil((stop - start)/step);
R = [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)];
CONFIGS     = cell(1,n);
INERTIA     = 1/8*[7 0 0;0 7 0; 0 0 2];
INV_INERTIA = inv(INERTIA);
MASS        = 1;
LENGTH      = sqrt(3)/2;
GRAVITY     = 9.81;
COG_VECTOR  = [0; 0; 1];

y = hmtop(3);
% vec1 is the initial angular momentum.
%      Here we transform the angular velocity to angular momentum by the 
%      inertia tensor.
vec1 = INERTIA*[0 0 1]';
% vec2 is the direction of gravity as seen in local coordinates.
%      The vector [0 0 1]' is premultiplied by an element in SO(3),
%      indicating the initial position. Since we start from the North pole,
%      we premultiply by the identity matrix.
vec2 = R'*[0 0 1]';
setdata(y,{vec1 vec2});
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex9');
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
disp('Step #5: Solve the ODE: This examples takes some time ....');
disp(' ');
disp('icur = f(y,0,5,0.01);');
icur = f(y,start,stop,step);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting characteristics of the solution.');

a = getdata(icur.y);
t = icur.t;

% Angular momentum:
%  l3 - projection on the axis of symmetry
%  lz - projection on the vertical
% Hamiltonian:
%  ham - total energy

n   = length(t)-1;
t   = t(1:n);
l3  = zeros(n,1);
lz  = l3;
gnorm = l3;
ham = l3;
pos = zeros(3,n);

for i = 1:n,
  l3(i) = a{i,1}(3);      % Picks out the last comp. since COG=[0 0 1]
  ham(i) = 1/2*a{i,1}'*INV_INERTIA*a{i,1} + ...
      MASS*LENGTH*GRAVITY*a{i,2}'*COG_VECTOR;
  % The following two functions are Casimirs - so they are always constant:
  lz(i) = a{i,1}'*a{i,2}; % Takes the inner prod. of ang. mom & grav. vec.
  gnorm(i) = a{i,2}'*a{i,2}; %
end;

figure(1)
subplot(3,1,1)
plot(t,lz-lz(1),'r')
title('Red: Lz:  Error in ang. mom. proj. on gravity axis');

subplot(3,1,2)
plot(t,l3-l3(1),'g')
title('Green: L3:  Error in ang. mom, proj, on symmetry axis');

subplot(3,1,3)
plot(t,lz,'r',t,l3,'g')
title('The conserved angular momentum quantities');

figure(2)
subplot(3,1,1)
plot(t,ham-ham(1),'k')
title('Black: Error in Hamiltonian');

subplot(3,1,2)
plot([0 t],[8.5; ham],'k');
title('The Hamiltonian');

subplot(3,1,3)
plot(t,gnorm-gnorm(1),'g')
title('Green: Error in norm of gravity vector');

disp('Done.');
disp(' ');
return;




