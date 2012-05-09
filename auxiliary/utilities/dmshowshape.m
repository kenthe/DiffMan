function [out] = dmshowshape(str)
% DMSHOWSHAPE - Turn on/off showing of shape of domain objects.
% function [out] = dmshowshape(str)

% WRITTEN BY       : Kenth Engø, 1999.04.09
% LAST MODIFIED BY : None

global DMSHOWSHAPE;

if (nargin == 0) | (nargout == 1),
  out = DMSHOWSHAPE;
  return;
end;
str = lower(str);
if strcmp(str,'on'),
  DMSHOWSHAPE = 1;
else,
  DMSHOWSHAPE = 0;  
end;
out = DMSHOWSHAPE;
return;
