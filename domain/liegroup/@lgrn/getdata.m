function [dat] = getdata(u)
% GETDATA - Returns the data representation of LGRN.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(u);
if len == 1,
  if isempty(u.data), dat = []; return; end;
  dat = u.data;
else					% length(u) > 1.
  dat = zeros(u(1).shape,len);
  for i = 1:len,
    mat = u(i).data;
    if isempty(mat),
    else
      dat(:,i) = mat;
    end;
  end;
  dat = dat(:);
end;
return;
