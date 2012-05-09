function [obj] = tsscg(varargin)
% TSSCG - Constructor for the symmetric 'CG' timestepper class.
% function [obj] = tsscg(varargin)

% WRITTEN BY       : Kenth Engø, 1998.06.07
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tsscg',timestepper);
  setmethod(obj,'CG3a');		% Sets default method to 'CG3a'
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tsscg',timestepper); % Creates new object!
  setmethod(obj,meth.RKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
