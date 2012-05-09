function [] = setvectorfield(f,vf)
% SETVECTORFIELD - Sets the vector field of the flow f to vf.

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.03.05

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if ~strcmp(class(vf),'vectorfield'),
    error('Second input is no vector field object');
  end;
end;

f.vectorfield = vf;
assignin('caller',name,f);
return;
