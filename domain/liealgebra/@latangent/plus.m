%-*-text-*-
function [w] = plus(u,v)
% PLUS - Vector addition in LATANGENT.
% function [w] = plus(u,v)

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

w.data = latplus(u.data,v.data,u.shape);
return;
