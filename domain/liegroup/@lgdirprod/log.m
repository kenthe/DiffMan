function z = log(a)
% LOG - Computes the lograrithm from LGDIRPROD -> LADIRPROD.
% function z = log(a)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

z = liealgebra(a);
if iscellempty(a.data), return; end;
if iscellempty(getshape(z)), return; end;

dat = cell(a.n,1);
sh = a.shape;
for i = 1:a.n
  dat{i} = lgdplog(a.data{i},sh{2}(i,:));
end;
setdata(z,dat);
return;
