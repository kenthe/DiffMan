function [w] = project(v,m)
% PROJECT - Projects 'm' onto the Lie algebra LASO.
% function [w] = project(v,m)

% WRITTEN BY : Hans Munthe-Kaas, april 1997
% MODIFIED BY: Kenth Kenth Engø, 1999.04.06

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

% Acceptable. 
w = (m-m')/2;
return;
