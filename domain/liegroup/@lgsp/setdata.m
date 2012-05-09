function [] = setdata(a,dat)
% SETDATA - Sets data representation in LGSP.
% function [] = setdata(a,dat)     

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK
name = inputname(1);

if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable!');
  end;
  if ~(isdata(a,dat)),
    error('Data is not of correct type!');
  end;
end;

a.data = dat;
assignin('caller',name,a);
return;
