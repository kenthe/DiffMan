function [] = setdata(a,m)
% SETDATA - Sets m to be the data of a.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
end;

if isdata(a,m),
  len = length(a);
  for i = 1:len,
    a(i).data{1} = m{i,1};
    a(i).data{2} = m{i,2};
  end;
  assignin('caller',name,a);  
else,
  error('Input data is not a data repr. for element in HMRN!');
end;
return;
