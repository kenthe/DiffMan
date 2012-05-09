function [v] = project(a,m)
% PROJECT - Returns matrix 'v' which is acceptable by LGSP.
% function [v] = project(a,m)     
%
% REMARK: This function uses Cayley symplectification. Assume that M 
%         can be written as M = (I+T)(I-T)^(-1). Define V = J^(-1)T 
%         = -JT. It is easy to show that V^T = V <=> M is symplectic,
%         hence take the symmetric part W = (V^T+V)/2 of V and take 
%         R = (I+JW)(I-JW)^(-1) as the symplectic projection of M.
%
% REFERENCE: Alex J. Dragt: Lie Methods for Nonlinear Dynamics with 
%                           Applications to Accelerator Physics.
%                           Draft, July 1, 1998.

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK
n = a.shape;

if DMARGCHK,
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,n])),
    error('Input vector has not correct size!');
  end;
end;

if isdata(a,m),
  v = m; return;
else,
  n = size(m,1);
  id = eye(n);
  j  = [zeros(n/2) eye(n/2); -eye(n/2) zeros(n/2)];
  t = (m - id)*inv(m + id);
  vv = -j*t;
  w = j*(vv + vv')/2;
  v = (id + w)*inv(id - w); 
end;
return;
