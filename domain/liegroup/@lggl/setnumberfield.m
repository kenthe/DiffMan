function [] = setnumberfield(u,field)
% SETNUMBERFIELD - Sets the number field of LGGL.
% function [] = setnumberfield(u,field)

% WRITTEN BY       : Kenth Engø, 1999.04.04
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~(strcmp(field,'R') | strcmp(field,'C')),
    error('The number fields are only: ''C'' or ''R''!');
  end;
end;

u.field = field;
u.data  = [];
assignin('caller',name,u)
return;
