function [d] = dist(a,b)
% DIST - Distance metric function on LASE.
% function [d] = dist(a,b)

% WRITTEN BY       : Kenth Engø, 1998.02.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

n = length(a);
if DMARGCHK
  if (length(b) ~= n)
    error('Input vectors not of same length');
  end;
end;

u = getdata(a);
v = getdata(b);

dif = zeros(n,2);
for i = 1:n
  dif(i,1) = norm(u{i,1} - v{i,1});
  dif(i,2) = norm(u{i,2} - v{i,2});
end;

d = sum(sum(dif))/(2*n);
return;
