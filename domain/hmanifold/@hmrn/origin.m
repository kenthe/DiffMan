function [orig] = origin(a)
% ORIGIN - Returns the 'origin' in the HMRN-space; [1 0 0 .. 0]'.
% function [orig] = origin(a)
%
% REMARK: The reason why zero(n,1) is not the origin is because
%         this is the trivial component has to be excluded in order 
%         to make the action transitive.

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

orig = hmrn(a);
vec = zeros(getshape(orig.shape),1); vec(1) = 1;
orig.data = vec;
return;
