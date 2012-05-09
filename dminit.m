function [] = dminit()
% DMINIT - Initialization of the DiffMan toolbox.
% function [] = dminit()

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.30

% Global variables
global DMPROGREP DMARGCHK DMSHOWSHAPE DMSHOWDATA DMOPTIMIZE
DMSHOWSHAPE = 1;   % Turn 'ON' showing of shape for domain objects.
DMSHOWDATA  = 1;   % Turn 'ON' showing of data for domain objects.
DMPROGREP   = 0;   % Turn 'OFF' progress reporting.
DMARGCHK    = 1;   % Turn 'OFF' argument checking.
DMOPTIMIZE  = 0;   % Turn 'OFF' use of optimized, shape dependent code.

% Set paths
[homePath,sep] = dmpath;
% First to the _least_ important folders.
% (We want most important on top due to the working of helpwin).
addpath([homePath sep 'auxiliary' sep 'utilities']);
%    Available utilities & example subdirectories
feval('addsubdir',[homePath sep 'auxiliary' sep 'examples']);
feval('addsubdir',[homePath sep 'auxiliary' sep 'utilities']);

% In this statement, most important should be on top
addpath(homePath,...
[homePath sep 'domain' sep 'liealgebra'],...
[homePath sep 'domain' sep 'liegroup'],...
[homePath sep 'domain' sep 'hmanifold'],...
[homePath sep 'field'],...
[homePath sep 'flow'],...
[homePath sep 'flow' sep 'timestepper'],...
[homePath sep 'auxiliary' sep 'examples'],...
[homePath sep 'auxiliary' sep 'demos'],...
[homePath sep 'auxiliary' sep 'documentation']);
% [homePath sep 'testproblems']);

% Clears the screen and sets format.
format compact;
%clc;

[ver,date] = dmversion;
disp(' ');
disp(['  DiffMan Version ' ver ' is initialized - ' date]);
disp(' ');
disp('  Please report any problems and/or bugs to: ');
disp('       help@diffman.no');
disp(' ')
disp('  For more information and how to get started, try:');
disp('      >> dmtutorial ');
disp('      >> dmhelp ');
disp('      >> demo ');
disp(' ');
return;
