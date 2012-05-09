function [] = setdata(a,m)
% SETDATA - Sets the data representation of 'a'.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if ~isdata(a,m),
    error('Input data is not a data repr. for HMISOSPEC object!');
  end;
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
end;

len = length(a);
for i = 1:len,
  a(i).data = m(:,:,i);
end;
assignin('caller',name,a);  
return;
