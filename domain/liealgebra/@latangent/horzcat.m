function [w] = horzcat(a,b)
% HORZCAT - Commutator LATANGENT (componentwise commutator).
% function [w] = horzcat(a,b)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if ~sameshape(a,b),
    error('Input objects do not have the same shape.');
  end;
end;

w = latangent;
if iscellempty(a.shape)|iscellempty(b.data), 
  return; 
else, 
  w.shape = a.shape; 
end;

if iscellempty(a.data)|iscellempty(b.data), return; end;

w.data = lathorzcat(a.data,b.data,a.shape);
return;
