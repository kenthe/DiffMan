function [] = setshape(a,sh)
% SETSHAPE - Sets shape information in LARN.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if ~(dmisinteger(sh))&(sh<1),
    error('Shape should be integer and greater than 1!');
  end;
end;

len = length(a);
for i = 1:len
  a(i).shape = sh;
  a(i).data  = [];
end;
assignin('caller',name,a);
return;


