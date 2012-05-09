function z = inv(a)
% INV - Computes the inverse element in LGDIRPROD.
% function z = inv(a)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

z = lgdirprod(a);
if iscellempty(a.data), return; end;

for i = 1:a.n
  z.data{i} = lgdpinv(a.data{i},a.shape{2}(i,:));
end;
return;
