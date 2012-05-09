function [] = setmatrix(a,dat)
% SETMATRIX - Sets matrix representation of LAGL.
% function [] = setmatrix(a,dat)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~ismatrix(a,dat),
    error('Input matrix is not of correct type!');
  end;    
end;

len = length(a);
for i = 1:len,
  a(i).data = dat(:,:,i);
end;
assignin('caller',name,a);
return;
