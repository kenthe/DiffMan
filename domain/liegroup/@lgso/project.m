function [v] = project(a,m)
% PROJECT - Projects 'm' onto LGSO.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

if DMARGCHK,
  n = a.shape;
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
  [v,r] = qr(m);                 % QR => Q orthogonal; det(Q) = +-1.
  if abs(det(v) + 1) < 10^3*eps, % if det(Q) == -1, negate last column.
    v(:,end) = -v(:,end);
  end;
end;
return;
