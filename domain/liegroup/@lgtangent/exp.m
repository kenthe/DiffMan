%-*-text-*-
function z = exp(lgr,a)
% EXP - Computes the exponetial from LATANGENT -> LGTANGENT.
% function z = exp(lgr,a)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK
  if ~isa(a,'latangent'),
    error('Second input argument is not of class: latangent');
  end;
end;

z = identity(lgr);
if iscellempty(getdata(a)), z.data = {{} {}}; return; end;

sh = getshape(a);
dat = getdata(a);

z.data = lgtexp(dat,z.shape);
return;
