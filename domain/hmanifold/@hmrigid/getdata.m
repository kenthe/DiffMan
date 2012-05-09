function [dat] = getdata(u)
% GETDATA - Returns the data representation of HMRIGID.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(u);
if ~isempty(u(1).shape),
  n   = getshape(u(1).shape);      % The length of the vectors.
  dat = zeros(n,len);
  for i = 1:len,
    if ~isempty(u(i).data),
      dat(:,i) = u(i).data;
    end;
  end;
else
  dat = [];
end;
return;

