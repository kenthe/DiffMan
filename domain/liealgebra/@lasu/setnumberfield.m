function [] = setnumberfield(u,field)
% SETNUMBERFIELD - Sets the number field of LASU.
% function [] = setnumberfield(u,field)

% WRITTEN BY       : Kenth Engø, 1999.04.04
% LAST MODIFIED BY : Kenth Engø, 1999.09.08

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
end;

if ~strcmp(field,'C'),
  error('The number field must be ''C''!');
end;
u.field = field;
u.data  = [];
assignin('caller',name,u)
return;
