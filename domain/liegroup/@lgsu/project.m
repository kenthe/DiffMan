function [v] = project(a,m)
% PROJECT - Returns matrix 'v' acceptable by LGSU. 
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
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
else
  [v,r] = qr(m);   % factor 'm' by QR => Q unitary; Q*Q^H = I.
  if abs(det(v) + 1) < 10^3*eps,   % if det(Q) == -1, negate last column.
    v(:,end) = -v(:,end);
  end;
end;
return;
