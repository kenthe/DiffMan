function [w] = uminus(u)
% UMINUS - Unary minus in LASE.
% function [w] = uminus(u)

% WRITTEN BY : Kenth Engø, 1998.01.27
% MODIFIED BY: Kenth Engø, 1999.04.12

w = u;
w.data{1} = -u.data{1};
w.data{2} = -u.data{2};
return;
