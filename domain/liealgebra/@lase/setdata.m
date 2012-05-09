function [] = setdata(a,m)
% SETDATA - Sets data representation of LASE.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 98.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end
  if ~isdata(a,m),
    error('Input matrix is not of correct type!');
  end;
end;

len = length(a);
for i = 1:len,
  a(i).data{1} = m{i,1};
  a(i).data{2} = m{i,2};
end;
assignin('caller',name,a);
return;
