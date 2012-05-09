function e = eig(a)
% EIG - Overloaded version of the MATLAB built-in eigenvalue function.
% function e = eig(a)

% WRITTEN BY       : Kenth Engø, 1998.06.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if hasmatrix(a),
  mat = getmatrix(a);
  if isempty(mat),
    error('The Lie group object contains no matrix data.');
  else
    e = builtin('eig',mat);
  end;
else
  error('The Lie group has no matrix representation.');
end;
return;
