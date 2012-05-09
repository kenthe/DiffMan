%-*-text-*-
function z = random(obj)
% RANDOM - Creates a random object in LGTANGENT.
% function z = random(obj)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

z = identity(obj);
if iscellempty(obj(1).shape), z = obj; return; end;

for i = 1:length(obj), % For the case: vectors of objects.
  z(i).data = lgtrandom(obj.shape);
end;
return;
