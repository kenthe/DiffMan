function [hnew,accepted] = newstepsize(fl,varargin)
% NEWSTEPSIZE - Computes a new step size to be used by time stepper objects.
%
% INPUT:
%        hold   - old stepsize
%        errest - local error estimate
%
% OUTPUT:
%        hnew     - new stepsize
%        accepted - '1' if step is accepted, '0' if step is rejected

% WRITTEN BY       : Arne Marthinsen, 1998.08.25
% LAST MODIFIED BY : Kenth Engø, 1999.03.05

global DMARGCHK DMVARSTEP

if DMARGCHK
  if ~isa(fl,'flow')
    error('First argument is not a flow object');
  end;
end;

if (nargin==1 & DMVARSTEP),
  error(['You have to supply an error estimate when using variable' ...
	' stepsize integration']);
end;

hold=varargin{1};
if nargin>2,
  errest=varargin{2};
end;

if DMVARSTEP
  def=getdefaults(fl);
  method=getmethod(gettimestepper(fl));
  h=def.pessimist*(def.tol/errest)^(1/(method.RKord+1))*hold;
  h=min(h,def.large*hold);
  h=max(h,def.small*hold);
  hnew=min(h,def.hmax);
  if(def.accept*def.tol-errest>0),
    accepted=1;
  else
    accepted=0;
  end;
else
  hnew=hold;
  accepted=1;
end;

return;
