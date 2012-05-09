function [obj] = tsrk(varargin)
% TSRK - Constructor for the 'RK' timestepper class.
% function [obj] = tsrk(varargin)

% WRITTEN BY       : Kenth Engø, 1998.06.05
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tsrk',timestepper);
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tsrk',timestepper); % Creates new object!
  setmethod(obj,meth.RKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
