function [d] = dist(a,b)
% DIST - Distance metric function on LASE(3)*.
% function [d] = dist(a,b)

% WRITTEN BY       : Kenth Engø, 1999.03.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

adat = getdata(a);
bdat = getdata(b);
d = 0;
for i = 1:length(a),
  d = d + norm(adat{i} - bdat{i})^2;
end;
d = sqrt(d);
return;
