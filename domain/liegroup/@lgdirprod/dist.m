function [d] = dist(a,b)
% DIST - An Euclidean type distance metric function on LGDIRPROD.
% function [d] = dist(a,b)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK,
  if ~sameshape(a,b)
    error('Input objects do not have the same shape');
  end;
  if iscellempty(a.data)|iscellempty(b.data),
    error('Data is not assigned to input objects.');
  end;
end;

d = 0;
for i = 1:a.n,
  d = d + lgdpdist(a.data{i},b.data{i});
end;
d = d^(1/2);
return;
