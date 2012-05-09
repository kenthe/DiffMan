function [] = setdata(a,dat)
% SETDATA - Sets data representation in LARN.
% function [] = setdata(a,dat)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
end;

setvector(a,dat); 
assignin('caller',name,a);
return;
