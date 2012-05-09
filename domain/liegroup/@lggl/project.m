function [v] = project(a,m)
% PROJECT - Returns matrix 'v' which is acceptable in LGGL.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1997.10.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

n = a.shape;
if DMARGCHK,
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if ~(all(size(m)==[n,n])),
    error('Input vector has not correct size!');
  end;
end;

if isdata(a,m),
  v = m; return;
else
  m = m+(norm(m)/n^2)*eye(n);
  if isdata(a,m),
    v = m; eeturn;
  else
    % NOTE: infinite recursion is possible - check out
    %       'matlab/toolbox/matlab/funfun/quad.m'
    v = project(a,m);
  end
end;
return;
