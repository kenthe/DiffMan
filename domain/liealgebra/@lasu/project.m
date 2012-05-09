function [w] = project(v,m)
% PROJECT - Project 'm' onto the Lie algebra LASU.
% function [w] = project(v,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

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

m(1,1) = m(1,1)-trace(m); % Trace(m) = 0.
w = (m-m')/2;
return;
