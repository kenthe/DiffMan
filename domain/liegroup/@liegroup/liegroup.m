function obj = liegroup(varargin)
% LIEGROUP - Constructor for LIEGROUP objects.
% function obj = liegroup(varargin)
%
% PURPOSE
%      A liegroup is a manifold equipped with a smooth binary operation
%      compatible with the manifold structure
%
% LIEGROUP is the virtual superclass of all Lie groups.

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if nargin == 0,				% No arguments: Default constructor.
  obj.dummy = []; % dont know any way to make struct without fields
  obj = class(obj,'liegroup');
  return;
end;

arg1 = varargin{1};
% Single argument of same class: Copy constructor
if nargin == 1 & isa(arg1,'liegroup'),
  obj = arg1;
  return;
end;

% First argument liegroup daughter class object.
%    Call daugther-class constructor with all arguments
if isa(arg1,'liegroup') & ~strcmp(class(arg1),'liegroup'),
   obj = feval(class(arg1),varargin{1:nargin});
   return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;

