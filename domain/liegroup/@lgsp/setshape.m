function [] = setshape(a,sh)
% SETSHAPE - Sets the shape information in LGSP.
% function [] = setshape(a,sh)     

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~(dmisinteger(sh)),
    error('Shape should be an integer!');
  end;
  if (~(mod(sh,2) == 0))|(sh < 2),
    error('Shape must be a positive, even integer!');
  end;
end;

a.shape = sh;
a.data  = [];
assignin('caller',name,a);
return;

