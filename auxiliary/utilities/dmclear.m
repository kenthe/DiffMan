function [] = dmclear(arg)
% DMCLEAR - Clears variables & globals not vital to DiffMan.
% function [] = dmclear(arg)

% WRITTEN BY       : Kenth Engø, 1999.04.01
% LAST MODIFIED BY : None

if nargin == 0,
  evalin('caller','clear'); return;
end;

arg = lower(arg);
if strcmp(arg,'all'),
  evalin('caller','clear');
  evalin('caller','clear mex');
  evalin('caller','dmclear global');
  evalin('caller','clear functions');
elseif strncmp(arg,'global',6),
  vars = who('global');
  for i = 1:length(vars)
    if ~strncmp(vars(i),'DM',2),
      evalin('caller',['clear global ' vars{i}]);
    end;
  end;
else,
  evalin('caller',['clear ' arg]);
end;
return;
