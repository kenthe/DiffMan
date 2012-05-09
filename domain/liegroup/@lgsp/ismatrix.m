function [v] = ismatrix(a,m)
% ISMATRIX - Checks if 'm' is a matrix representation of LGSP.
% function [v] = ismatrix(a,m)     

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

n = a.shape;
if DMARGCHK,
  if ~all(size(m) == [n,n]),
    error('Input data does not have the correct size.');
   end;
end;

nn = n/2;
if isempty(n), v = 0; return; end;
J = [ zeros(nn) eye(nn); - eye(nn) zeros(nn)];

if norm(m'*J*m - J) < 10^3*eps,
  v = 1;
else
  v = 0;
end;
return;



