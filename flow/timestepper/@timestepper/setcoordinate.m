function [] = setcoordinate(ts,coord)
% SETCOORDINATE - Sets the coordinates to be used by the timestepper object.
% function [] = setcoordinate(ts,coord)

% WRITTEN BY       : Kenth Engø, 1998.06.04
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if ~strcmp(coord,'exp') & ~strcmp(coord,'cay') & ~strcmp(coord,'pade22'),
    error('The input coordinates does not exist.');
  end;
end;

ts.coordinate = coord;
assignin('caller',name,ts)
return;
