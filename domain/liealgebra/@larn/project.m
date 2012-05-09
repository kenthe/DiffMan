function [v] = project(a,m)
% PROJECT - Returns vector 'v' which is acceptable in LARN.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

n = a(1).shape;
len = length(a);

if DMARGCHK,
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,len])),
    error('Input data matrix has not correct size!');
  end;
end;

% all vector-data are acceptable
v = m;
return;
