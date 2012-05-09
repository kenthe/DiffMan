function [w] = project(v,m)
% PROJECT - Project matrice 'm' onto LAUN:  (m-m')/2.
% function [w] = project(v,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.04

global DMARGCHK

if DMARGCHK
  n = v.shape;
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,n])),
    error('Input matrix is not of correct size!');
  end;
end;

% acceptable 
w = (m-m')/2;
return;
