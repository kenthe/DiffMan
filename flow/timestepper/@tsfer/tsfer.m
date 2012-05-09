function [obj] = tsfer(varargin)
% TSFER - Constructor for the 'fer' timestepper class.
% function [obj] = tsfer(varargin)
%
% DEFAULTS: The default method of timesteppers in the fer
%           class is the fourth order method 'fer4a'.
%           Default coordinates are 'exp'.

% WRITTEN BY       : Arne Marthinsen, 1998 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tsfer',timestepper);
  setmethod(obj,'fer4G2');		% Sets default method to 'fer4G2'.
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tsfer',timestepper); % Creates new object!
  setmethod(obj,meth.RKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;

