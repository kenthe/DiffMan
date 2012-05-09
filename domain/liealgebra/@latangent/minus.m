%-*-text-*-
function [w] = minus(u,v)
% MINUS - Vector subtraction in LATANGENT.
% function [w] = minus(u,v)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if ~sameshape(u,v),
    error('Input objects do not have the same shape.');
  end;
end;

w = latangent;
if iscellempty(u.shape)|iscellempty(v.shape), 
  return; 
else, 
  w.shape = u.shape; 
end;

if iscellempty(u.data)|iscellempty(v.data), return; end;

w.data = latminus(u.data,v.data,u.shape);
return;
