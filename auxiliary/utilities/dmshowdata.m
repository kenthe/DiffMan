function [out] = dmshowdata(arg)
% DMSHOWDATA - Turn on/off showing of data of domain objects.
% function [out] = dmshowdata(arg)

% WRITTEN BY       : Kenth Engø, 1999.04.09
% LAST MODIFIED BY : None

global DMSHOWDATA;

if (nargin == 0) | (nargout == 1),
  out = DMSHOWDATA;
  return;
end;
arg = lower(arg);
if strcmp(arg,'on'),
  DMSHOWDATA = 1;
else,
  DMSHOWDATA = 0;  
end;
out = DMSHOWDATA;
return;
