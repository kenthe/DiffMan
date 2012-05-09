function [dat] = getdata(u)
% GETDATA - Returns a vector that represents the element u.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(u);
if len == 1,
  if isempty(u.data), dat = []; return; end;
  dat = u.data;
else,					% length(u) > 1.
  sh = u(1).shape;
  n = getshape(sh);
  dat = zeros(n,len);
  for i = 1:len,
    vec = u(i).data;
    if isempty(vec), else, dat(:,i) = vec; end;
  end;
  dat = dat(:);
end;
return;

