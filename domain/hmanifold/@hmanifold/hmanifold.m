function obj = hmanifold(varargin)
% HMANIFOLD - Constructor for HMANIFOLD-objects.
% function obj = hmanifold(varargin)
%
% DESCRIPTION:
%      A homogeneous manifold is a manifold acted upon by a Lie group
%      action. 
%
% HMANIFOLD is the virtual superclass of all homogeneous manifolds.

% WRITTEN BY       : Kenth Engø, 1997.10.26
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if nargin == 0,				% No arguments: Default constructor.
  obj.dummy = [];
  obj = class(obj,'hmanifold');
  return;
end;

arg1 = varargin{1};
if nargin == 1 & isa(arg1,'hmanifold'),
  obj = arg1;
  return;
end;

if isa(arg1,'hmanifold') & ~strcmp(class(arg1),'hmanifold'),
   obj = feval(class(arg1),varargin{1:nargin});
   return;
end;

% Other cases: Something is wrong!
error('Function is called with illegal arguments!');
return;

