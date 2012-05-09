function e = norm(a,alt)
% NORM - Overloaded version of the MATLAB built-in norm function.
% function e = norm(a,alt)

% WRITTEN BY       : Kenth Engø, 1999.02.22
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

dat = getdata(a);
if isempty(dat{1}) | isempty(dat{2}),
  error('The object contains no data.');
else
  if (nargin == 1),
    e1 = builtin('norm',dat{1});
    e2 = builtin('norm',dat{2});
    e  = sqrt(e1^2+e2^2);
  else
    e1 = builtin('norm',dat{1},alt);
    e2 = builtin('norm',dat{2},alt);
    e  = sqrt(e1^2+e2^2);
  end;
end;
return;
