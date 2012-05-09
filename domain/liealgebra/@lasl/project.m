function [w] = project(v,m)
% PROJECT - Projects onto the Lie algebra LASL.
% function [w] = project(v,m)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Apr.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.06

global DMARGCHK

n = v.shape;
if DMARGCHK,
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,n])),
    error('Input matrix is not of correct size!');
  end;
end;

mat = m;
mat(1,1) = mat(1,1) - sum(diag(m,0));
w = mat;
return;
