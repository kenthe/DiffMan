%-*-text-*-
function [d] = dist(a,b)
% DIST - An Euclidean type distance metric function on LATANGENT.
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

if iscellempty(a.shape)|iscellempty(b.shape),
  disp('      One argument is an generic latangent object, hence it makes');
  disp('      no sense to calculate distance with it.');
  return;
end;

d = latdist(a.data,b.data)^(1/2);
return;
