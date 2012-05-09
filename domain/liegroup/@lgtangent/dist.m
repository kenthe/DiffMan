%-*-text-*-
function [d] = dist(a,b)
% DIST - An Euclidean type distance metric function on LGTANGENT.
% function [d] = dist(a,b)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if ~sameshape(a,b)
    error('Input objects do not have the same shape');
  end;
  if iscellempty(a.data)|iscellempty(b.data),
    error('Data is not assigned to input objects.');
  end;
end;

d = lgtdist(a.data,b.data)^(1/2);
return;
