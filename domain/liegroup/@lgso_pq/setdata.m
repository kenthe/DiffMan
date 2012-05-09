function [] = setdata(a,dat)
% SETDATA - Sets the data representation in LGSO_PQ.
% function [] = setdata(a,dat)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

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
