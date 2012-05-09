function [obj] = tsmagnus(varargin)
% TSMAGNUS - Constructor for the 'MAGNUS' timestepper class.
% function [obj] = tsmagnus(varargin)
%
% DEFAULTS: The default method of timesteppers in the Magnus class is the
%           fourth order method 'M4a'. Default coordinates are 'exp'.

% WRITTEN BY       : Kenth Engø, 1998.06.07
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tsmagnus',timestepper);
  setmethod(obj,'M4a');			% Sets default method to 'M4a'.
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tsmagnus',timestepper); % Creates new object!
  setmethod(obj,meth.RKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;

