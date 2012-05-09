%-*-text-*-
function [dist] = latdist(a,b)
% LATDIST - Euclidean type metric function on group - Recursive function.
% function [dist] = latdist(a,b)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

dist = 0;
if iscell(a),  % Is a cell-array: more subdata-matrices.
  n = length(a);
  for i = 1:n,
    dist = dist + latdist(a{i},b{i});
  end;
else,    % Input is two matrices of some sort.
  dist = norm(a - b,2)^2;
end;
return;
