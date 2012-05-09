function [dat] = getdata(u)
% GETDATA - Returns a vector repr. of the data.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

len = length(u);
dat = cell(len,2);
for i = 1:len,
  if ~(isempty(u(i).data{1})&isempty(u(i).data{2})),
    dat{i,1} = u(i).data{1};
    dat{i,2} = u(i).data{2};
  end;
end;
return;

