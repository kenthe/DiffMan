function [] = setdata(a,m)
% SETDATA - Sets the data representation of LASO_PQ.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~ismatrix(a,m),
    error('Input matrix is not of correct type!');
  end;
end;

len = length(a);
for i = 1:len,
  a(i).data = m(:,:,i);
end;

assignin('caller',name,a);
return;
