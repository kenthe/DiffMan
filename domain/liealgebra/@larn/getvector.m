function [dat] = getvector(u)
% GETVECTOR - Returns the vector representation of LARN.
% function [dat] = getvector(u)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(u);
if len == 1,
  if isempty(u.data), dat = []; return; end;
  dat = u.data;
else					% Length(u) > 1.
  dat = zeros(u(1).shape,len);	        % Creates matrix of size: dim x len -
  for i = 1:len,			%  in the LARN-case:
    vec = u(i).data;			%  dim == shape (length of vector).
    if isempty(vec),
    else
      dat(:,i) = vec;
    end;
  end;
  dat = dat(:);
end;
return;

