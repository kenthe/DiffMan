function [p] = dmprogrep(arg)
% DMPROGREP - choose whether or not DiffMan should report progress
%
% Usage:
%
%    dmprogrep on;
%    dmprogrep off;
%
%    p = dmprogrep; % observes state (0,1).
%    

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Dec.
% LAST MODIFIED BY : None

global DMPROGREP;

if nargin == 0,
   p = DMPROGREP;
   return;
end;
if strcmp(arg,'on')
   DMPROGREP = 1;
else,
   DMPROGREP = 0;
end;
p = DMPROGREP;
return;
