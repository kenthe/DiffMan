function w = identity(obj)
% ZERO - Creates the identity object in LGDIRPROD.
% function w = identity(obj)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

w = lgdirprod(obj);
if iscellempty(obj.shape), return; end;

sh = obj.shape;
for j = 1:obj.n
  w.data{j} = lgdpidentity(sh{2}(j,:));
end;
return;
