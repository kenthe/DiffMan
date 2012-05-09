function [] = seteqntype(vf,type)
% SETEQNTYPE - Sets the equation-type-field of vf equal to 'type'.
% function [] = seteqntype(vf,type)

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if length(type) == 1,
    if ~strcmp(lower(type),'l') & ~strcmp(lower(type),'g'),
      error('Input is not a string of correct type.');
    end;
  else,
    if ~strcmp(lower(type),'linear') & ~strcmp(lower(type),'general'),
      error('Input is not a string of correct type.');
    end;
  end;
end;

vf.eqntype = type(1);

assignin('caller',name,vf)
return;

