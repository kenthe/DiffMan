function [dat] = getdata(u)
% GETDATA - Returns a vector that represents an element u in the N-sphere.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(u);
if len == 1,
  if isempty(u.data), dat = []; return; end;
  dat = u.data;
else					% length(u) > 1.
  dat = zeros(getshape(getshape(u(1))),len);	% Creates matrix: vlen x len.
  for i = 1:len,
    vec = u(i).data;
    if isempty(vec), else dat(:,i) = vec; end;
  end;
  dat = dat(:);
end;
return;




