function [v] = getvector(a)
% GETVECTOR - Returns the vector representation in LASE.
% function [v] = getvector(a)

% WRITTEN BY       : Kenth Engø, 1998.01.26
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
