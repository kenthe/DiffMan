function [] = dmex1()
% DMEX1 - DiffMan example # 1.
%
% DMEX1:           This is an ODE evolving in SO(3)
% DOMAIN:          hmlie(lgso(3))
% ACTION:          Left multiplication of lgso(3) on itself
% GENERATOR MAP:   'vfex1'
% EQUATION TYPE:   'Linear'

clc
disp(' ');
disp('DMEX1:           This is an ODE evolving in SO(3)');
disp('DOMAIN:          hmlie(lgso(3))');
disp('ACTION:          Left multiplication of lgso(3) on itself.');
disp('GENERATOR MAP:   ''vfex1''');
disp('EQUATION TYPE:   ''Linear''');
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
setfm2g(vf,'vfex1');
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
disp('icur = f(y,0,2.5,0.05);');
icur = f(y,0,2.5,0.05);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc, clf
disp(' ');
disp('Plotting the solution.');
a = getdata(icur.y);
t = icur.t;
d = zeros(3,length(t));
for i = 1:size(a,3),
  d(:,i) = a(:,:,i)*[0 ; 0; 1];
end;
plot3(d(1,:),d(2,:),d(3,:))
hold on
plot3(d(1,end),d(2,end),d(3,end),'>r')
plot3(d(1,1),d(2,1),d(3,1),'or')
title('Starting point: o');
disp('Done.');
disp(' ');
return;




