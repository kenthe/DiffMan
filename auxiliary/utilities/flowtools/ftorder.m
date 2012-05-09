function [out] = ftorder(flA,flB,y0,t0,tend,h0,EX)
% FTORDER - Utility function that computes the order of approximation for
%           an integrator in the flow class
%
% CALLED AS:  out = ftorder(flA,flB,y0,t0,tend,h0);
%           where
%             flA  - the flow object to estimate
%             flB  - the reference flow object (giving "exact" solution)
%             y0   - the initial data
%             t0   - (if specified) overrules the default value "tstart"
%             tend - (if specified) overrules the default value "tend"
%             h0   - (if specified) overrules the default value "stepsize"
%           and
%             out.lerror=lerror;     (local error approximation)
%             out.gerror=gerror;     (global error approximation)
%             out.lerr=lerr;         (local error estimate)
%             out.gerr=gerr;         (global error estimate)

% WRITTEN BY       : Arne Marthinsen, October 1998
% LAST MODIFIED BY : 

global DMARGCHK

if DMARGCHK
  if ~isa(flA,'flow'),
    error('First argument is not a flow object');
  end;
  if ~isa(flB,'flow'),
    error('Second argument is not a flow object');
  end;
  if ((nargin < 3)|(nargout > 1)),
    error('Wrong number of input/output arguments!');
  end;
  if ~isa(y0,'hmanifold'),
    error('Third argument is no manifold object');
  end;
  if nargin > 3,
    if ~isreal(t0),
      error('t0 is a non-scalar argument');
    end;
    if nargin > 4,
      if ~isreal(tend),
	error('tend is a non-scalar argument');
      end;
      if nargin > 5,
	if ~isreal(h0),
	  error('h0 is a non-scalar argument');
	end;
      end;
    end;
  end;
end;

def=getdefaults(flA); % flB is the reference integrator

% initialization
if (nargin<4 | isempty(t0)), t0=def.tstart; end;
if (nargin<5 | isempty(tend)), tend=def.tend; end;
if (nargin<6 | isempty(h0)), h=def.stepsize; else h=h0; end;

% declaration
lerr=zeros(def.numstep,1);
gerr=zeros(def.numstep,1);
step=zeros(def.numstep,1);

if def.disp,
  fprintf(1,'Estimating order of approximation:\n');
end;

% compute "exact" solution at t=tend
if def.newexact,
  if def.disp,
    fprintf(1,'   computing the "exact" solution...\n');
  end;
  EXglobicur=flB(y0,t0,tend,h/((2^def.numstep)*def.global));
else
  if nargin<7,
    error('You must supply exact solution if "newexact=0"');
  end;
  EXglobicur=EX;
end;

if def.disp,
  fprintf(1,'   looping %d times: ',def.numstep);
end;

for k=1:def.numstep
  h=h/2;
  if def.disp,
    fprintf(1,'%d ',k);
  end;

  % integration giving local order estimates
  EXlocicur=flB(y0,t0,t0+h,h/def.local);
  locicur=flA(y0,t0,t0+h,h);

  % integration giving global order estimates
  globicur=flA(y0,t0,tend,h);

  % compute the errors
  tdiff=abs(globicur.t(length(globicur.t))-EXglobicur.t(length(EXglobicur.t)));
  if tdiff>100*eps,
    fprintf(1,['Warning: |tend_approx-tend_exact|=%6.4f. '...
	  'Error estimation may be wrong.\n'],tdiff);
  end;

  lerr(k)=dist(locicur.y(length(locicur.y)),EXlocicur.y(length(EXlocicur.y)));
  gerr(k)=dist(EXglobicur.y(length(EXglobicur.y)),...
      globicur.y(length(globicur.y)));
  step(k)=h;
end

% compute the order of approximation
lorder=log(lerr(1:def.numstep-1)./lerr(2:def.numstep))./...
    log(step(1:def.numstep-1)./step(2:def.numstep));
gorder=log(gerr(1:def.numstep-1)./gerr(2:def.numstep))./...
    log(step(1:def.numstep-1)./step(2:def.numstep));

if def.disp,
  fprintf(1,'\n\n   Local order:');
  for k=1:length(lorder)
    fprintf(1,'\t%6.4f',lorder(k));
  end;
  fprintf(1,'\n\n   Global order:');
  for k=1:length(gorder)
    fprintf(1,'\t%6.4f',gorder(k));
  end;
  fprintf(1,'\n\n');
end;

out.lorder=lorder;
out.gorder=gorder;
out.lerr=lerr;
out.gerr=gerr;
out.step=step;

if def.newexact,
  out.exact=EXglobicur;
end;

if def.disp,
  fprintf(1,'done ftorder\n');
end;

return;
