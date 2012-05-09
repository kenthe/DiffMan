function [v] = getdata(a)
% GETDATA - Returns the data representation in LASE.
% function [v] = getdata(a)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

len = length(a);
v = cell(len,2);
for i=1:len
  if ~(isempty(a(i).data{1})&isempty(a(i).data{2})),
    v{i,1} = a(i).data{1};
    v{i,2} = a(i).data{2};
  end;
end;
return;

