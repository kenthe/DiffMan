function [] = dmex5()
% DMEX5 - DiffMan example # 5.
%
% DMEX5:           This is an ODE evolving on the sphere S^2
% DOMAIN:          hmnsphere(3)
% ACTION:          Matrix multiplication of lgon(3) on S^2
% GENERATOR MAP:   'vfex5'
% EQUATION TYPE:   'Linear'

clc
disp(' ');
disp('DMEX5:           This is an ODE evolving on the sphere S^2');
disp('DOMAIN:          hmnsphere(3)');
disp('ACTION:          Matrix multiplication of lgon(3) on S^2');
disp('GENERATOR MAP:   ''vfex5''');
disp('EQUATION TYPE:   ''Linear''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmnsphere(3);
setdata(y,[0 0 1]');
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex5');
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
setcoordinate(ts,'exp');
setmethod(ts,'butcher6');
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
disp('icur = f(y,0,5,0.05);');
icur = f(y,0,5,0.05);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting the solution.');
a = getdata(icur.y);
t = icur.t;
a = reshape(a,3,length(t));

n = 2^5 - 1;
theta = pi*(-n:2:n)/n;
phi = (pi/2)*(4:2:n)'/n;
xx = cos(phi)*cos(theta);
yy = cos(phi)*sin(theta);
zz = sin(phi)*ones(size(theta));
colormap([1 1 1])
C = zz;
surf(xx,yy,zz,C)
axis equal;
view(3);
hold on

plot3(a(1,:),a(2,:),a(3,:));
view(-37.5,45)
h = findobj('Type','line');
set(h,'LineWidth',2.0)

disp('Done.');
disp(' ');
return;




