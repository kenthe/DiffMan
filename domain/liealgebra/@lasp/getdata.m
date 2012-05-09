function [v] = getdata(a)
% GETDATA - Returns data representation of LASP.
% function [v] = getdata(a)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
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

