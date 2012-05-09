function [] = setshape(a,sh)
% SETSHAPE - Sets the shape information in HMLIE.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1997.10.28
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable!');
  end;
  if ~(isa(sh,'liealgebra')|isa(sh,'liegroup')),
    error('Input shape is not of Lie alg./grp. class');  
  end;
  if (hasshape(sh)&isempty(getshape(sh))),
    error('Shape object contains no shape information!');
  end;
end;

if strcmp(class(sh),'lgtangent'),
  setdata(sh,cell(2,1));
elseif strcmp(class(sh),'lgdirprod'),
  shsh = getshape(sh);
  n = size(shsh{2},1);
  setdata(sh,cell(1,n));
else 
  setdata(sh,[]);
end;
a.shape = sh;
a.data = [];
assignin('caller',name,a);
return;
