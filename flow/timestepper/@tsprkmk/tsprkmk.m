function [obj] = tsprkmk(varargin)
% TSPRKMK - Constructor for the 'RKMK' timestepper class.
% function [obj] = tsprkmk(varargin)

% WRITTEN BY       : Kenth Engø, 2000 April.
% LAST MODIFIED BY : None

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tsprkmk',timestepper);
  setmethod(obj,'SE1');   % Default method: Symplectic Euler.
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tsprkmk',timestepper); % Creates new object!
  setmethod(obj,meth.PRKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
