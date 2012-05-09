function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation of LGSP.
% function [v] = isdata(a,m)     

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

global DMARGCHK

n = a.shape;
if DMARGCHK,
  if ~all(size(m) == [n,n]),
    error('Input data does not have the correct size.');
   end;
end;

nn = n/2;
if isempty(n), v = 0; return; end;
if isempty(m), v = 1; return; end;  % allow for setting the data to empty.
J = [ zeros(nn) eye(nn); - eye(nn) zeros(nn)];

if norm(m'*J*m - J) < 10^3*eps,
  v = 1;
else
  v = 0;
end;
return;


