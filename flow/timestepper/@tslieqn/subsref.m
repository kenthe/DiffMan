function [out] = subsref(tso,s)
% SUBSREF - Overloaded version for TSLIEQN. See: @timestepper/subsref.m 
% function [out] = subsref(tso,s)
%
% CALLED AS:  out = tsobj(vf,y,t,h);
%           where
%             out.ylow=ylow;     (low order approximation)
%             out.yhigh=yhigh;   (high order approximation)
%             out.errest=errest; (error estimate)
%           when using variable stepsize, and
%             out.ylow=ylow;     (low order approximation)
%             out.errest=-1;     (error estimate)
%           when using constant stepsize

% WRITTEN BY       : Hans Munthe-Kaas, 2000.01.27

global DMARGCHK DMVARSTEP

n = length(s.subs);

% Input arguments:
vf = s.subs{1}; y  = s.subs{2}; t  = s.subs{3}; h  = s.subs{4};
% Vector field information:
fm2g = getfm2g(vf); eqntype = geteqntype(vf);
if ~strcmp(eqntype,'Linear'),
	error('Method only applicable to linear problems.');
end;
if DMVARSTEP,
    error(' Does not support variable stepsize yet.');
end;

% Timestepper information
V  = tso.V;
c = tso.c;
sig = tso.sig;
ns = length(c);

% Evaluate the function at the timesteps
a1 = h*feval(fm2g,t+h*c(1),y);
ai = zeros(a1,ns);
q = ai;
ai(1) = a1;
for i = 2:ns,
	ai(i) = h*feval(fm2g,t+h*c(i),y);
end;
% Transform to taylor basis
for i = 1:ns,
	q(i) = V(i,:)*ai;
end;
% compute sigma
rsig = eval(sig,q);
out.ylow = lambda(rsig,y,'exp');
out.errest = -1;

return;
