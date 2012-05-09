function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for PRKMK. See: @timestepper/subsref.m 
% function [out] = subsref(tso,s)
%
% CALLED AS:  out = tsobj(vf,y,t,h);
%           where
%             out.ylow   = ylow;   (low order approximation)
%             out.errest = -1;     (error estimate)
%           when using constant stepsize.

% WRITTEN BY       : Kenth Engø, 2000 April
% LAST MODIFIED BY : None

global DMARGCHK DMVARSTEP

% Input arguments:
vf = s.subs{1}; y = s.subs{2}; t = s.subs{3}; h = s.subs{4};

if DMARGCHK
  if ~isa(vf,'vectorfield'),
    error('First argument is no vectorfield object');
  end;
  if ~isa(y,'hmanifold'),
    error('First argument is no manifold object');
  end;
  if ~isreal([t h]),
    error('Non-scalar argument as input number 3 and/or 4');
  end;
end;

% Vector field information:
fm2g = getfm2g(vf); eqntype = geteqntype(vf);

% Timestepper information
meth  = getmethod(tso); coord = getcoordinate(tso);

if strcmp(meth.PRKname,'SE1'),

  TOLERENCE = 10^(-15); MAX_ITERATION = 250; 
  ITERATION = 0; ITER_DIST = TOLERENCE + 1;
  INIT = zero(feval(fm2g,t,y));
  q0 = pi(INIT,1); p0 = pi(INIT,2);

  while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION),
    q1 = h*pi(feval(fm2g,t+h,lambda(ladirprod(q0,p0),y,coord)),1);
    ITER_DIST = dist(q1,q0);
    ITERATION = ITERATION + 1;
    q0 = q1;
  end;
  p1 = h*pi(feval(fm2g,t,lambda(ladirprod(q1,p0),y,coord)),2);
  out.ylow   = lambda(ladirprod(q1,p1),y,coord);
  out.errest = -1;

  if (ITERATION == MAX_ITERATION),
    disp(['Max. number of iterations reached: ' int2str(ITERATION)]);
    disp(['The obtained tolerance was:        ' num2str(ITER_DIST)]);
    disp(' ');
  end;

else,

  TOLERENCE = 10^(-10); MAX_ITERATION = 50; ITERATION = 0;
  NEW = zeros(feval(fm2g,t,y),meth.PRKns); OLD = NEW; 
  ITER_DIST = TOLERENCE + 1;
  while (ITER_DIST > TOLERENCE)&(ITERATION < MAX_ITERATION)
    Kj = pi(OLD,1);
    Lj = pi(OLD,2);
    for j = 1:meth.PRKns,		
      K = Kj*(h*meth.PRKa(j,1:meth.PRKns));
      L = Lj*(h*meth.PRKat(j,1:meth.PRKns));
      KxL = ladirprod(K,L);
      TMP = feval(fm2g,'err',lambda(KxL,y,coord));
      NEW(j) = feval(['d' coord 'inv'],KxL,TMP,meth.PRKord-1);
    end;
    ITER_DIST = dist(NEW,OLD);
    ITERATION = ITERATION + 1;
    OLD = NEW;
  end;

  if (ITERATION == MAX_ITERATION),
    disp(['Max. number of iterations reached: ' int2str(ITERATION)]);
    disp(['The obtained tolerance was:        ' num2str(ITER_DIST)]);
    disp(' ');
  end;

  Kj = pi(NEW,1); 
  Lj = pi(NEW,2);
  K = Kj*(h*meth.PRKb);
  L = Lj*(h*meth.PRKbt);

  out.ylow   = lambda(ladirprod(K,L),y,coord);
  out.errest = -1;
end;

if DMVARSTEP,
  error('TSPRKMK does not support variable time-stepping.');
end;
return;
