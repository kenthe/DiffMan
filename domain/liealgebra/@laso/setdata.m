function [] = setdata(a,m)
% SETDATA - Sets the data representation of LASO.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end
end;

setmatrix(a,m);
assignin('caller',name,a);
return;
