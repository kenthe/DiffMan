function [v] = getdata(a)
% GETDATA - Returns the data representation in LASO_PQ.
% function [v] = getdata(a)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

len = length(a);
if len == 1,
  if isempty(a.data), v = []; return; end;
  v = a.data;
else
  n = sum(a(1).shape);
  v = zeros(n,n,len);
  for i = 1:len,
    mat = a(i).data;
    if isempty(mat), else v(:,:,i) = mat; end;
  end;
end;
return;

