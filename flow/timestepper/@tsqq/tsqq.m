function [obj] = tsqq(varargin)
% TSQQ - Constructor for the 'QQ' timestepper class.
% function [obj] = tsqq(varargin)
%
% DEFAULTS: The default method of timesteppers in the QQ class is the
%           fourth order method 'qq4a'. Default coordinates are 'cay'.

% WRITTEN BY       : Arne Marthinsen, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

if (nargin == 0),
  obj.dummy = [];
  obj       = class(obj,'tsqq',timestepper);
  setmethod(obj,'qq4a');		% Sets default method to 'qq4a'.
  return;
end;

arg = varargin{1};
if (nargin == 1) & isa(arg,'timestepper'),
  meth      = getmethod(arg);		% Saves the old 'method'.
  coord     = getcoordinate(arg);	% Saves the old 'coordinates'.
  obj.dummy = [];
  obj       = class(obj,'tsqq',timestepper); % Creates new object!
  setmethod(obj,meth.RKname);		% Sets method & coordinates to 
  setcoordinate(obj,coord);		% that of input object.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;

