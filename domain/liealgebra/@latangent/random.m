%-*-text-*-
function z = random(obj)
% RANDOM - Creates a random object in LATANGENT.
% function z = random(obj)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

z = zero(obj);
if iscellempty(obj(1).shape), z = obj; return; end;

for i = 1:length(obj), % For the case: vectors of objects.
  z(i).data = latrandom(obj.shape);
end;
return;
