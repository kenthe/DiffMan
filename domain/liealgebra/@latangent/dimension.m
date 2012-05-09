%-*-text-*-
function [dim] = dimension(a)
% DIMENSION - Returns the dimensions of the vectorspaces.
% function [dim] = dimension(a)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

if iscellempty(a.shape),
  disp('      This is an generic latangent-object, hence it contains');
  disp('      no dimension information.');
  return;
end;

dim = latdimension(a.shape);
return;


