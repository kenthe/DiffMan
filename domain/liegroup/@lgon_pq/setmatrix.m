function [] = setmatrix(a,m)
% SETMATRIX - Sets the matrix representation in LGON_PQ.
% function [] = setmatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~ismatrix(a,m),
    error('Input data is no matrix representation!');
  end;
end;

a.data = m;
assignin('caller',name,a);
return;
