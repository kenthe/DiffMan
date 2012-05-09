%-*-text-*-
function z = log(a)
% LOG - Computes the logarithm from LGTANGENT -> LATANGENT.
% function z = log(a)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

z = liealgebra(a);
if iscellempty(a.data), return; end;

dat = lgtlog(a.data,a.shape);
setdata(z,dat);
return;
