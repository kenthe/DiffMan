function [] = setnumberfield(u,field)
% SETNUMBERFIELD - Sets the number field of LASO.
% function [] = setnumberfield(u,field)

% WRITTEN BY       : Kenth Eng�, 1999.04.06
% LAST MODIFIED BY : None

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~strcmp(field,'R'),
    error('The number field must be ''R''!');
  end;
end;

u.field = field;
u.data  = [];
assignin('caller',name,u)
return;
