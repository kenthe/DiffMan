function [] = setdata(a,m)
% SETDATA - Sets 'm' to be the data of 'a' in HMSINEEULER.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~isdata(a,m),
    error('Input data is not a data repr. for elements in HMSINEEULER!');
  end;
end;

len = length(a);
for i = 1:len,
  a(i).data = m(:,i);
end;
assignin('caller',name,a);  
return;
