function [] = setnumberfield(u,field)
% SETNUMBERFIELD - Sets the number field of LGSE.
% function [] = setnumberfield(u,field)

% WRITTEN BY       : Kenth Eng�, 1999.04.12
% LAST MODIFIED BY : None

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~(strcmp(field,'R'),
    error('The number fields must be ''R''!');
  end;
end;

u.field = field;
u.data  = [];
assignin('caller',name,u)
return;
