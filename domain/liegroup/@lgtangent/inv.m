%-*-text-*-
function z = inv(a)
% INV - Computes the inverse element in LGTANGENT.
% function z = inv(a)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

z = identity(a);
if iscellempty(a.data), z.data = {{} {}}; return; end;

z.data = lgtinv(a.data,a.shape);
return;
