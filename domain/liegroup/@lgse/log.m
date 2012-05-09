function [v] = log(a)
% LOG - Computes the logarithm of objects in LGSE.
% function [v] = log(a)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

sh = a.shape;
vm = [a.data{1} a.data{2}; zeros(1,sh) 1];
vm = logm(vm);
mat = vm(1:sh,1:sh);
vec = vm(1:sh,sh+1);
v = lase(sh);
%setdata(v,{mat vec});   
v.data = {mat vec};			% This is faster!
return;
