%-*-text-*-
function [v] = project(a,m)
% PROJECT - Returns cell vector v 'near' m which is acceptable LATANGENT.
% function [v] = project(a,m)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if length(m) ~= 2,
    error('Cell vector is of incorrect length!');
  end;
end;

if iscellempty(a.shape), v = {{} {}}; return; end;
v = latproject(a.shape,m);
return;

