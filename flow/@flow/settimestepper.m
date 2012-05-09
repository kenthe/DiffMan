function [] = settimestepper(f,ts)
% SETTIMESTEPPER - Sets the timestepper of the flow f to ts.

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 1999.03.05

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if ~isa(ts,'timestepper'),
    error('Second input is no timestepper object');
  end;
end;

f.timestepper = ts;
assignin('caller',name,f);
return;
