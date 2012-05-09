function [] = setshape(a,sh)
% SETSHAPE - Sets the shape information in LASO_PQ.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end
  if ~(dmisinteger(sh) & (length(sh) == 2) & all(sh > 0)),
    error('Shape should be a positive integer 2-vector!'); 
  end; 
end

a.shape = sh;
a.data  = [];
assignin('caller',name,a);
return;

