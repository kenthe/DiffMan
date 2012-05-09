function [w] = getmatrix(g)
% GETMATRIX - Returns the matrix representation of LASE.
% function [w] = getmatrix(g)

% WRITTEN BY       : Kenth Engø, 1998.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

len = length(g);
v = cell(len,2);

for i=1:len,
  if ~(isempty(g(i).data{1})&isempty(g(i).data{2})),
    w{i,1} = [0 -g(i).data{1}(3) g(i).data{1}(2); ...
              g(i).data{1}(3) 0 -g(i).data{1}(1); ...
	      -g(i).data{1}(2) g(i).data{1}(1) 0];
    w{i,2} = g(i).data{2};
  end;
end;
return;
