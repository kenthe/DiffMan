function [] = setshape(a,sh)
% SETSHAPE - Sets the shape information in LGSE.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Eng�, 1998.01.15
% LAST MODIFIED BY : Kenth Eng�-Monsen, 2012.04.24 

global DMARGCHK

name = inputname(1);
if DMARGCHK
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
a.data  = {[] []};
assignin('caller',name,a);
return;

