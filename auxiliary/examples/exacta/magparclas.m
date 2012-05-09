function [icur] = magparclas(x0,v0,timespan,h)
% Particle in magnetic field, classical integrator
% eks:  magparclas([0 -2.5 0]',12e-3*[0 0 1]',500)
% eks:  magparclas([0 -2.5 0]',12e-3*[0 0 1]',10000)
%

y = hmlie(lgrn(6));
setdata(y,[x0; v0]);

vf = vectorfield(y);
setfm2g(vf,'vfparticle');

ts = tsrkmk;

f = flow;
setmethod(ts,14);
settimestepper(f,ts);
setvectorfield(f,vf);
setdefaults(f,'hmax',10);
tstart = 0;
tend   = timespan;
icur = f(y,tstart,tend,h);

a = getdata(icur.y);
t = icur.t;
a = reshape(a,6,length(t));

clf;

% Tegn jorda
figure(1);
clf;
tegnjord;
hold on;
axis([-2 2 -2 2 -2 2]);

X = a(1,:);
Y = a(2,:);
Z = a(3,:);
plot3(X,Y,Z,'r');
title('TRAJECTORY OF PARTICLE IN EARTHS MAGNETIC FIELD');

figure(2);
clf;
plot(t(2:length(t)),diff(t));
xlabel('TIME');
ylabel('STEPSIZE');
title('STEPSIZES USED THROUGHOUT THE INTEGRATION PROCESS');
% sjekk slutthastighet
n = size(a,2);
ve = [a(4,end) a(5,end)  a(6,end) ]';
xe = [a(1,end) a(2,end)  a(3,end) ]';
vslutt = norm(ve,2);
vbeg = norm(v0,2);
disp(['     Difference in norm of initial and final velocity: ' ...
       sprintf('%0.5g',vbeg-vslutt)]); 
disp(' ');

mbeg = [0 0 1]*(v0-bpotential(x0));
mend = [0 0 1]*(ve-bpotential(xe));
disp(['     Difference in momentum map: ' ... 
       sprintf('%0.5g',mbeg-mend)]); 
disp(' ');
return;

function [a] = bpotential(x)
a = cross([0 0 1]',x);
a = a/(norm(x)^3);
return;

function [] = tegnjord();
load topo
colormap(topomap1)
[x,y,z] = sphere(24);
a = min(min(topo));
b = max(max(topo));
to = fix(64*(topo-a)/(b-a)+1);
to(find(to>64)) = 64;
surface(x,y,z,'FaceColor','texture','Cdata',topo);
axis square;
view(3);
return;



