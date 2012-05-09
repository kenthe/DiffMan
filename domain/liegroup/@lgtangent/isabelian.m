%-*-text-*-
function [v] = isabelian(a)
% ISABELIAN - Returns 'true' if LGTANGENT is Abelian.
% function [v] = isabelian(a)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

v = lgtisabelian(a.shape);
return;
