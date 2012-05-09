function [] = setvector(a,v)
% SETVECTOR - Sets vector representation in LASE.
% function [] = setvector(a,v)

% WRITTEN BY       : Kenth Engø, 98.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable');
  end
end

setdata(a,v)
assignin('caller',name,a)
return;

