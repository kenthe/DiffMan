function [obj] = timestepper(varargin)
% TIMESTEPPER - Constructor TIMESTEPPER virtual superclass.
% function [obj] = timestepper(varargin)

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

if (nargin == 0),
  obj.coordinate = 'exp';		% Default coordinates: 'exp'.
  obj.method     = [];
  obj = class(obj,'timestepper');
  setmethod(obj,'RK4');		        % Sets default method: 'RK4'.
  return;
end;

arg = varargin{1};			% Copy constructor.
if (nargin == 1) & (isa(arg,'timestepper')),
  obj = arg;
  return;
end;

% First argument timestepper daughter class object
%    Call daugther-class constructor with all arguments
if isa(arg1,'timestepper') & ~(strcmp(class(arg1),'timestepper')),
  classname = class(arg);
  obj = feval(classname,varargin{1:nargin});
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
