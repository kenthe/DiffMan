function w = zero(obj)
% ZERO - Creates the zero object in the Lie algebra LADIRPROD.
% function w = zero(obj)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

w = ladirprod(obj);
if iscellempty(obj.shape), return; end;

sh = obj.shape;
for j = 1:obj.n
  w.data{j} = ladpzero(sh{2}(j,:));
end;
return;
