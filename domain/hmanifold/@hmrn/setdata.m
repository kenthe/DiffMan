function [] = setdata(a,m)
% SETDATA - sets m to be the data repr. of a.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~isdata(a,m),
    error('Input data is not a data repr. for element in HMRN!');
  end;
end;
  
len = length(a);
m = reshape(m,getshape(a(1).shape),len);
for i = 1:len,
  a(i).data = m(:,i);
end;
assignin('caller',name,a);  
return;
