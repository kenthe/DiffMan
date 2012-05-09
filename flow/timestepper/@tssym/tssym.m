function [obj] = tssym(varargin)
% TSSYM - Constructor for the 'SYMMETRIC' timestepper class.

% WRITTEN BY       : Hans Munthe-Kaas & Kenth Engø, Jan. 1999
% LAST MODIFIED BY : None

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tssym',timestepper);
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tssym',timestepper); % Creates new object!
  setmethod(obj,meth.RKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
