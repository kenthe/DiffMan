function e = norm(a,alt)
% NORM - Overloaded version of the MATLAB built-in norm function.
% function e = norm(a,alt)

% WRITTEN BY       : Kenth Engø, 1998.06.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

dat = getdata(a);
if isempty(dat),
  error('The Lie group object contains no data.');
else
  if (nargin == 1),
    e = builtin('norm',dat);
  else
    e = builtin('norm',dat,alt);
  end;
end;
return;
