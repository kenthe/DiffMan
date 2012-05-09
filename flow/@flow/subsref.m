function [icurve] = subsref(f,s)
% SUBSREF - Overloads the parenthesis for flow objects.
%
% DECSRIPTION:
%      When a flow object is evaluated, the integral curve of the flow f
%      through the point y from t0 to tf is approximated using a
%      numerical integrator (timestepper) with stepsize h.
%
% function [icurve] = subsref(y,t0,tf,h,TSmethod)
%
% INPUT:
%        y        - Initial point on the manifold.
%        t0       - Initial time.
%        tf       - Final time.
%        h        - Step length.
%        TSmethod - Timestepper. This is an object of class 'timestepper'.
%                   Use the timestepper defined by the object.
%                   For more info:
%                      >> dmhelp timestepper
%
% OUTPUT: icurve - structure with fields:
%         icurve.yi  - vector of objects such that isa(yi(i),getdomain(f))==1.
%         icurve.ti  - vector of the corresponding time steps.
%         icurve.rej - vector containing information about the rejected steps.
%
% NOTE: If you want progres reported: >> dmprogrep on;
%
% REFERENCE: 
%            http://www.math.ntnu.no/num/synode/

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.03.05

global DMARGCHK DMPROGREP DMVARSTEP

i = length(s.subs);
if DMARGCHK
  if ~isa(s.subs{1},'hmanifold'),
    error('First argument is no manifold object');
  end;
  if ~isreal([s.subs{2} s.subs{3} s.subs{4}]),
    error('Non-scalar argument as input number 2, 3, or 4');
  end;
end;

y     = s.subs{1}; t     = s.subs{2};
tf    = s.subs{3}; h     = s.subs{4};
if (i < 5), 
  Stepper = f.timestepper;
else
  Stepper = s.subs{5}; 
end;

if (h < 0), DMVARSTEP=1; h=-h; else, DMVARSTEP=0; end;
if isempty(f.vectorfield), error('Vector field not set!'); end;

% Adjust timestep such that we arrive exactly in tf.
if isempty(t), error('Initial time not set!'); end;
if isempty(tf), error('End time not set!'); end;
if t >= tf, error('Initial time >= end time!'); end;

if ~DMVARSTEP,
  nstep=ceil((tf-t)/h);
end;

chunk=1024;
yi    = zeros(y,chunk+1); 		% In homogeneous space!!
ti    = zeros(1,chunk+1);
rej   = zeros(1,chunk+1);
yi(1) = y;
ti(1) = t;

if t+h>tf
  h=tf-t;
end

n=1;
accepted=0;
rejected=0;
errest=0;

if DMPROGREP,
  if DMVARSTEP,
    disp(['Warning: progress report is not currently available in' ...
	  ' variable stepsize mode']);
    DMPROGREP=0;
  else
    repprogress('Time integration:');
  end;
end;

while (ti(n)+h<=tf & h>100*eps),
  if DMPROGREP, repprogress(n,1,nstep); end;

  while ~accepted,
    vout=Stepper(f.vectorfield,yi(n),t,h);
    if DMVARSTEP,
      ylow=vout.ylow;
      yhigh=vout.yhigh;
      errest=vout.errest;
    else
      yhigh=vout.ylow;
    end;

    % estimate error and compute new stepsize
    if DMVARSTEP,
      if errest==-1,
	errest=dist(ylow,yhigh);
      end;
      [hnew,accepted]=newstepsize(f,h,errest);
    else
      [hnew,accepted]=newstepsize(f,h);
    end;

    if ~accepted
      h=hnew;
      rejected=rejected+1;
    end;
  end;

  % check if the next stepsize is too large
  if ti(n)+h+hnew>tf
    hnew=tf-(ti(n)+h);
  end;

  % allocate more storage if needed
  if n>=length(ti)
    yi=[yi,zeros(y,chunk)];
    ti=[ti,zeros(1,chunk)];
    rej=[rej,zeros(1,chunk)];
  end;

  % step finished - update system
  n=n+1;
  t=t+h;
  ti(n)=t;
  yi(n)=yhigh;         % use local extrapolation
  rej(n)=rejected;
  h=hnew;
  accepted=0;
  rejected=0;
end;

icurve.y = yi(1:n);
icurve.t = ti(1:n);
icurve.rej = rej(1:n);

return;
