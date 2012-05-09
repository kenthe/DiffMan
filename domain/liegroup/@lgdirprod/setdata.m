function [] = setdata(a,m)
% SETDATA - Sets data of 'a' equal to the data-representation 'm'. 
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  % check if m is a cell vector of correct length
  if ~isdata(a,m),
    error('Data cell vector is not of correct type.');
  end;
end;

a.data = m;
assignin('caller',name,a);
return;
