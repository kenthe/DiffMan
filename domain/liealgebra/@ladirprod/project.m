function [v] = project(a,m)
% PROJECT - Returns 'v' which is acceptable by LADIRPROD.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK,
  if length(m) ~= a.n,
    error('Cell vector is of incorrect length!');
  end;
end;

if iscellempty(a.shape), v = {}; return; end;

sh = a.shape;
v = cell(a.n,1);

for j = 1:a.n
  v{j} = ladpproject(sh{2}(j,:),m{j});
end;
return;

