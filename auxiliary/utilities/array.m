function [a] = array(sh,obj)
% function [a] = array(shape,obj)
% Make an array of an object of sizes given in shape.
%
% Precisely: 
%    size(a) == shape, a(ind) == obj for all indexes within the limits of shape
% 
% Example: a = array([1,3],zero(b)) do the same as a = zeros([1,3],b).

% WRITTEN BY       : Hans Munthe-Kaas, 1998 Nov.
% LAST MODIFIED BY : None.

a(1:(prod(sh))) = obj;
a = reshape(a,sh);

	