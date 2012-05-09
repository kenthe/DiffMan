function [] = setshape(a,sh)
% SETSHAPE - Sets shape information in HMTOP. 
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable!');
  end;
  if isempty(getshape(sh)),
    error('Shape object contains no shape information!');
  end;
end;

if isa(sh,'lase'),
  a.shape = lase(sh); 		% Just need shape-info, no data!
  a.data = [];
  assignin('caller',name,a);
else
  error('Input shape is not of class LASE!!');  
end;
return;
