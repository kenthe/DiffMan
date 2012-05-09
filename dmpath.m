function [homepath,fsep] = dmpath()
% DMPATH - Return info on the path of the Diffman toolbox.
%
% function [homepath,fsep] = dmpath()
%
% 'homepath' is the path, and 'fsep' is the file separator symbol on the
% computer.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1998.11.19

homepath = which('dminit');
homepath = homepath(1:length(homepath)-9);
fsep = filesep;
return;
