function [v] = getmatrix(a)
% GETMATRIX - Returns matrix repr. of objects in LAGL.
% function [v] = getmatrix(a)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(a);
if len ==  1,
  if isempty(a.data), v = []; return; end;
  v = a.data;
else
  n = a(1).shape;
  v = zeros(n,n,len);			% Array: n x n x len.
  for i = 1:len,
    mat = a(i).data;
    if isempty(mat), else v(:,:,i) = mat; end;
  end;
end;
return;
