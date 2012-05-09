function [] = setdefaults(f,varargin)
% SETDEFAULTS - Sets the defaults of the flow f to ts.

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 1999.03.05

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
end;

n = length(varargin);
if (rem(n,2) == 0),
  for i = 1:2:n-1
    f.defaults = setfield(f.defaults,varargin{i},varargin{i+1});
  end;
else
  error('Function called with illegal inputs');
end;
assignin('caller',name,f);
return;
