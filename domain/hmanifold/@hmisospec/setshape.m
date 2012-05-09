function [] = setshape(a,sh)
% SETSHAPE - Sets shape information in HMISOSPEC.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  if ~strcmp(class(sh),'laso'),		% Check sh of correct class.
    error('Input shape is not of class: laso');
  end;
  if isempty(getshape(sh)),
    error('Laso-object contains no shape information!');
  end;
end;

a.shape = laso(sh);			% Just need shape-info, no data!
a.data = [];
assignin('caller',name,a);
return;
