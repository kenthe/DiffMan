function [] = setmatrix(a,m)
% SETMATRIX - Issues a WARNING: LARN does not have a matrix repr.
% function [] = setmatrix(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable')
  end
end;

disp('      Warning: The LARN-class does not have a matrix representation.');
disp('                Use the functions: ''setdata'' or ''setvector'' instead.');
return;
