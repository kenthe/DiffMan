%-*-text-*-
function [] = setshape(a,sh)
% SETSHAPE - Sets shape information in 'a' and sets data to empty.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
end;

if isempty(sh), a = lgtangent; assignin('caller',name,a); return; end;

a = lgtangent;
a.shape = sh;
a.data = {{} {}};
assignin('caller',name,a);
return;
