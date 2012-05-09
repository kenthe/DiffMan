function [dist] = ladpdist(a,b)
% LADPDIST - Euclidean type distance - Recursive function.
% function [dist] = ladpdist(a,b)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

dist = 0;
if iscell(a),  % Is a cell-array: more subdata-matrices.
  n = length(a);
  for i = 1:n,
    dist = dist + ladpdist(a{i},b{i});
  end;
else,    % Input is two matrices of some sort.
  dist = norm(a-b,2)^2;
end;
return;
