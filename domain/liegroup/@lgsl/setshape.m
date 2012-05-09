function [] = setshape(a,sh)
% SETSHAPE - Sets shape information in LGSL.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1997.10.09
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
  if sh<1,
    error('Shape should be positive!');
  end;
end;

a.shape = sh;
a.data  = [];
assignin('caller',name,a);
return;

