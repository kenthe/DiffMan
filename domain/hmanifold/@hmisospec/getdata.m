function [dat] = getdata(u)
% GETDATA - Returns a matrix repr. of the isospectral flow object.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07
 
len = length(u);
if len == 1,
  if isempty(u.data), dat = []; return; end;
  dat = u.data;
else					% length(u) > 1.
  n = getshape(getshape(u(1)));
  dat = zeros(n,n,len);	                % Creates matrix: n x n x len.
  for i = 1:len,
    mat = u(i).data;
    if isempty(mat), else dat(:,:,i) = mat; end;
  end;
end;
return;




