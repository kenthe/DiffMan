%-*-text-*-
function [w] = uminus(u)
% UMINUS - Uniary minus in the Lie algebra LATANGENT.
% function [w] = uminus(u)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

w = latangent;
w.shape = u.shape;
if iscellempty(u.data), return; end;

w.data = latuminus(u.data,u.shape);
return;
