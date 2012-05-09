function [] = dmex6()
% DMEX6 - DiffMan example # 6.
%
% DMEX6:           Integration of an isospectral flow
% DOMAIN:          hmisospec(3)
% ACTION:          lgso(3) x R^(nxn) -> R^(nxn); (g,A)-> g A g^(-1)
% GENERATOR MAP:   'vfex6'
% EQUATION TYPE:   'General'

clc
disp(' ');
disp('DMEX6:           Integration of an isospectral flow');
disp('DOMAIN:          hmisospec(3)');
disp('ACTION:          lgso(3) x R^(nxn) -> R^(nxn); (g,A)-> g A g^(-1)');
disp('GENERATOR MAP:   ''vfex6''');
disp('EQUATION TYPE:   ''General''');
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #1: Construct an initial domain object in a homogeneous space:');
disp(' ');
y = hmisospec(3);
init = [-1 1 0; 1 0.5 1; 0 1 0.5];
setdata(y,init);
y
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Step #2: Construct a vectorfield object over the domain object:');
disp(' ');
vf = vectorfield(y);
setfm2g(vf,'vfex6');
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
disp('icur = f(y,0,10,0.25);');
icur = f(y,0,10,0.25);
disp(' ');
disp('Pause. Press any key to continue.');
pause

clc
disp(' ');
disp('Calculates the spectrum of the solution:');
a = getdata(icur.y);
eigval = zeros(3,size(a,3));
for i = 1:size(a,3)
  eigval(:,i) = sort(eig(a(:,:,i)));
end;
eigval
disp('Done.');
disp(' ');
return;
