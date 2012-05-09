function [] = repprogress(t,t0,tfinal)
% REPPROGRESS - report progress in a computation every 15 seconds.
%
% function [] = repprogress(i,lowlim,uplim);
%
% Usage:
%    Put within a loop like this:
%
%       repprogress('Message_string'); 
%       for i = lowlim:uplim,
%          repprogress(i,lowlim,uplim);
%          % stuff deleted
%       end;
%
%    Then the progress will be reported every 30 seconds.
%
%    The 'Message_string' describes the task being done.
%
%    The routine cost 19 flops per iteration, except the iterations where
%    progress is really reported.
%
%

% Written by : Hans Munthe-Kaas, Feb. 1997
% Last modified by: Hans Munthe-Kaas, 1997.12.05

global LastProgressReport;
global LastProgressPercent;
global RepProgressString;
global TICTOC;

if nargin<2; % initialize
   if isempty(TICTOC),
      tic;
   end;
   LastProgressReport = toc;
   LastProgressPercent = 0;
   if nargin==0,
      RepProgressString = '';
   else,
      RepProgressString = t;
   end;
   return;
end;
%
time = toc;
deltime = time-LastProgressReport;
if deltime < 30,
   return;
end;
%
if ~isempty(RepProgressString),
   fprintf(2,[RepProgressString,'\n']);
   RepProgressString = '';
end;
pc = 100*(t-t0)/(tfinal-t0);
wi = pc-LastProgressPercent;  % work increase since last time
if wi>0,
   tleft = (deltime/wi)*(100-pc);
   minutes = floor(tleft/60.0);
   seconds = round(tleft-60*minutes);
   fprintf(2,'   Work done: %5.1f %%. Estimated time left:%4.0f min. %2.0f seconds.\n',pc,minutes,seconds);
else,
   fprintf(2,'   Work done: %5.1f %%. \n',pc);
end;
LastProgressReport = time;
LastProgressPercent = pc;
return;
