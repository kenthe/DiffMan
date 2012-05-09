function [w] = project(v,m)
% PROJECT - Projects onto the Lie algebra LASE.
% function [w] = project(v,m)

% WRITTEN BY : Kenth Engø, 98.01.16
% MODIFIED BY: Kenth Engø, 1999.04.12

global DMARGCHK

n = v.shape;

if DMARGCHK
  if isempty(n),
    error('Update variable has no shape.');
  end;
end;

if ((length(m{1}) == n*(n-1)/2) & (length(m{2}) == n)),
  w = lase(n);
  w.data{1} = m{1};
  w.data{2} = m{2};
end;
return;
