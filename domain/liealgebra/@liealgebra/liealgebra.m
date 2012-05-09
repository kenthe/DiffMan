function obj = liealgebra(varargin)
% LIEALGEBRA - Constructor for virtual superclass of all liealgebras.
% function obj = liealgebra(varargin)
%
% PURPOSE
%  A liealgebra is a vectorspace equipped with a bilinear skewsymmetric
%  bracket
%
% LIEALGEBRA is the virtual superclass of all Lie algebras.

% WRITTEN BY       : Hans Munthe-Kaas, March 1997
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

if nargin == 0,				% No arguments: Default constructor.
  obj.dummy = []; % dont know any way to make struct without fields
  obj = class(obj,'liealgebra',liegroup); % Every (Lie algebra,+) is a group.
  return;
end;

arg1 = varargin{1};
% Single argument of same class: Copy constructor
if nargin == 1 & isa(arg1,'liealgebra'),
  obj = arg1;
  return;
end;

% First argument liealgebra daughter class object
%    Call daugther-class constructor with all arguments
if isa(arg1,'liealgebra') & ~(strcmp(class(arg1),'liealgebra')),
  classname = class(arg1);
  obj = feval(classname,varargin{1:nargin});
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
