function [p] = dmargcheck(arg)
% DMCHECK - should DiffMan routines check input arguments or not?
%
%    Default: 1.
%
%    If set to 0, things may go faster, but also errors will not easily be
%    detected.
%
% Usage:
%
%    dmargcheck on;
%    dmargcheck off;
%
%    p = dmargcheck; % observes state (0,1).
%    

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Dec.
% LAST MODIFIED BY : None

global DMARGCHK;

if nargin == 0,
   p = DMARGCHK;
   return;
end;
if strcmp(arg,'on')
   DMARGCHK = 1;
else,
   DMARGCHK = 0;
end;
p = DMARGCHK;
return;
