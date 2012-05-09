function [dat] = getdata(u)
% GETDATA - Returns a vector representation of HMSINEEULER.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

len = length(u);
n = getshape(u(1).shape);
dat = zeros(n/2,len);
for i = 1:len,
  if ~isempty(u(i).data)
    dat(:,i) = u(i).data;
  end;
end;
return;
