function [d] = freedim(a)
% FREEDIM - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1998 Nov.
% LAST MODIFIED BY : None.

sh = getshape(a);
sh = sh{1};
d = sh(1);
