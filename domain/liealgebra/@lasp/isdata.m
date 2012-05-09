function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a valid data representation for LASP.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

n = a.shape;
if DMARGCHK,
  if ~all(size(m) == [n n]),
    error('Input data is not of correct size.');
  end;
end;

if isempty(n), v = 0; return; end;
J  = [zeros(n/2) eye(n/2); -eye(n/2) zeros(n/2)];

if norm(J*m + m'*J) < 10^3*eps, 
  v = 1;
else
  v = 0;
end;
return;

