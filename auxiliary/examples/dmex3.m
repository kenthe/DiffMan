function [] = dmex3()
% DMEX3 - DiffMan example # 3.
%
% DMEX3:           This is a linear ODE evolving in SO(3)
% DOMAIN:          hmlie(lgso(3))
% ACTION:          Left multiplication of lgso(3) on itself
% GENERATOR MAP:   'vfex3'
% EQUATION TYPE:   'Linear'

clc
disp(' ');
disp('DMEX3:           This is an ODE evolving in SO(3)');
disp('DOMAIN:          hmlie(lgso(3))');
disp('ACTION:          Left multiplication of lgso(3) on itself.');
disp('GENERATOR MAP:   ''vfex3''');
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
setfm2g(vf,'vfex3');
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
disp('icur = f(y,0,1,0.05);');
icur = f(y,0,1,0.05);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Calculates the determinant of the solution:');
a = getdata(icur.y);
determ = zeros(1,size(a,3));
for i = 1:size(a,3),
  determ(i) = det(a(:,:,i));
end;
determ
disp('Done.');
disp(' ');
return;




