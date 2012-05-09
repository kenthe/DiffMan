function [v] = project(a,m)
% PROJECT - Returns matrix 'v' which is acceptable by LAGL.
% function [v] = project(a,m)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

n = a.shape;
if DMARGCHK,
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,n])),
    error('Input matrix is not correct size!');
  end;
end;

v = m;
return;
