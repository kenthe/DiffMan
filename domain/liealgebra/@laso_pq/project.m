function [w] = project(v,m)
% PROJECT - Projects 'm' onto the Lie algebra LASO_PQ.
% function [w] = project(v,m)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK
  if isempty(v.shape),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[sum(v.shape) sum(v.shape)])),
    error('Input matrix is not of correct size!');
  end;
end;

p = v.shape(1);
q = v.shape(2);
w = zeros(p+q);
J = diag([ones(1,p),-ones(1,q)]);
w(1:p,1:p) = (m(1:p,1:p) - m(1:p,1:p)')/2;
w(p+1:end,p+1:end) = (m(p+1:end,p+1:end) - m(p+1:end,p+1:end)')/2;
w(1:p,p+1:end) = m(1:p,p+1:end);
w(p+1:end,1:p) = m(1:p,p+1:end)';
return;
