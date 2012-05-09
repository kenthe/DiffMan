function [] = setdata(a,m)
% SETDATA - Sets the data representation of LADIRPROD. 
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
  % check if m is a cell vector of correct length
  if length(m) ~= a.n,
    error('Cell vector is of incorrect length!');
  end;
  if ~isdata(a,m),
    error('Data cell vector is not of correct type.');
  end;
end;

a.data = m;
assignin('caller',name,a);
return;
