function [] = setdata(a,dat)
% SETDATA - Sets the data representation in LGSE.
% function [] = setdata(a,dat)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable!');
  end;
  if ~isdata(a,dat),
    error('Data is not of correct type!');
  end;
end;

a.data = dat;
assignin('caller',name,a);
return;
