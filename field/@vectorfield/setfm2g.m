function [] = setfm2g(vf,map)
% SETFM2G - Sets the map describing the differential equation.
% function [] = setfm2g(vf,map)

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end
  if ~ischar(map),
    error('Input is not a string');
  end;
end;

vf.fm2g = map;

assignin('caller',name,vf)
return;

