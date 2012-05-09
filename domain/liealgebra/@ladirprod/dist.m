function [d] = dist(a,b)
% DIST - An Euclidean type distance metric function on LADIRPROD.
% function [d] = dist(a,b)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.04.11

global DMARGCHK

if DMARGCHK,
  if ~sameshape(a,b)
    error('Input objects do not have the same shape');
  end;
  if iscellempty(a(1).data)|iscellempty(b(1).data),
    error('Data is not assigned to input objects.');
  end;
end;

d = 0;
for k = 1:length(a), % Vector of objects.
  for i = 1:a(1).n,
    d = d + ladpdist(a(k).data{i},b(k).data{i});
  end;
end;
d = d^(1/2);
return;
