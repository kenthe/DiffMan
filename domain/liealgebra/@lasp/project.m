function [w] = project(v,m)
% PROJECT - Returns matrix 'w' which is acceptable of LASP.
% function [w] = project(v,m)

% WRITTEN BY       : Kenth EngÅ¯, 1998.11.18
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

J = [zeros(n/2) eye(n/2); -eye(n/2) zeros(n/2)];
vv = -J*m;
w = J*(vv + vv')/2;
return;
