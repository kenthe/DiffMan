function [] = setmatrix(a,m)
% SETMATRIX - Sets matrix representation in LAUN.
% function [] = setmatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.04

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
