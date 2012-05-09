function [v] = getmatrix(a)
% GETMATRIX - Returns the matrix representation in LASO.
% function [v] = getmatrix(a)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

len = length(a);
if len == 1,
  if isempty(a.data), v = []; return; end;
  v = a.data;
else
  n = a(1).shape;
  v = zeros(n,n,len);
  for i = 1:len,
    mat = a(i).data;
    if isempty(mat), else v(:,:,i) = mat; end;
  end;
end;
return;

