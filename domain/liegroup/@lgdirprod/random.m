function z = random(obj)
% RANDOM - Creates a random object in LGDIRPROD.
% function z = random(obj)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

z = lgdirprod(obj);
if iscellempty(obj(1).shape), z = obj; return; end;

for i = 1:length(obj), % For the case: vectors of objects.
  sh = obj(i).shape;
  for j = 1:obj(i).n
    z(i).data{j} = lgdprandom(sh{2}(j,:));
  end;
end;
return;
