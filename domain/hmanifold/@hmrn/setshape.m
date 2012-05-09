function [] = setshape(a,sh)
% SETSHAPE - Sets the shape information in HMRN. 
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable!');
  end;
  if ~(isa(sh,'liealgebra') & hasmatrix(sh)),
    error('Input shape is not of Lie alg./grp. class');  
  end;
  if isempty(getshape(sh)),
    error('Shape object contains no shape information!');
  end;
end;

nam = class(sh);
a.shape = feval(nam,sh); 		% Just need shape-info, no data!
a.data = [];
assignin('caller',name,a);
return;
