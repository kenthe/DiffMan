function [v] = project(a,m)
% PROJECT - Returns the matrix 'v' which is  acceptable LGON.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if isempty(a.shape),         % check if m is a matrix of correct shape.
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[a.shape,a.shape])),
    error('Input vector has not correct size!');
  end;
end;

if isdata(a,m),
  v = m;       
  return;
else
  [v,r] = qr(m);         % we have to project - let's use the QR-algorithm.
end;
return;
