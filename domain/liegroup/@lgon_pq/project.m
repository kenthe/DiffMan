function [v] = project(a,m)
% PROJECT - Projects 'm' onto LGON_PQ.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1999.04.06
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  n = sum(a.shape);
  if isempty(a.shape),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,n])),
    error('Input matrix does not have the correct size!');
  end;
end;

if isdata(a,m),
  v = m; return;
else
  v = expm(project(laso_pq(a.shape),m));
end;
return;
