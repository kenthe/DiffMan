function e = eig(a)
% EIG - Overloaded version of the MATLAB built-in eigenvalue function.
% function e = eig(a)

% WRITTEN BY       : Kenth Engø, 1998.06.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~hasmatrix(a),
    error('The Lie algebra has no matrix representation.');
  end;
end;

mat = getmatrix(a);
if isempty(mat),
  error('The Lie algebra object contains no matrix data.');
else
  e = builtin('eig',mat);
end;
return;
