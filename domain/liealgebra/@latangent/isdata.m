%-*-text-*-
function [v] = isdata(a,m)
% ISDATA - Checks if 'm' is a data representation for LATANGENT.
% function [v] = isdata(a,m)

% WRITTEN BY       : Kenth Eng�, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if length(m) ~= 2,
    error('Cell vector is of incorrect length!');
  end;
end;

v = latisdata(a.shape,m);
return;
