function [id] = identity(a)
% IDENTITY - Returns the identity in LGSE.
% function [id] = identity(a)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

sh = a.shape;
id = lgse(sh);
id.data{1} = eye(sh);
id.data{2} = zeros(sh,1);
return;
