function [dist] = lgdpdist(a,b)
% LGDPDIST - Euclidean type distance - Recursive function.
% function [dist] = lgdpdist(a,b)

% WRITTEN BY       : Kenth Eng��, 1998 Nov.
% LAST MODIFIED BY : Kenth Eng��, 2000.03.23

dist = 0;
if iscell(a),  % Is a cell-array: more subdata-matrices.
  n = length(a);
  for i = 1:n,
    dist = dist + lgdpdist(a{i},b{i});
  end;
else,    % Input is two matrices of some sort.
  dist = norm(a - b,2)^2;
end;
return;
