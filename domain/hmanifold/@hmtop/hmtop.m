function obj = hmtop(varargin)
% HMTOP - Constructor for HMTOP-objects.
% function obj = hmtop(varargin)
%
% DESCRIPTION:
%   Elements of HMTOP are actually elements of the dual of the Lie algebra
%   of the Euclidean group LGSE; that is LASE*. A typical element consists
%   of a data part that contains a cell vector with two 3X1 vectors and a
%   shape part consisting of a lase(3) object.

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

superiorto('lase');

if nargin == 0,				% No arguments: Default constructor.
  obj.shape = [];
  obj.data = {[] []};
  obj = class(obj,'hmtop',hmanifold);
  return;
end;

arg = varargin{1};
if nargin == 1,
  obj.shape = [];
  obj.data = {[] []};
  obj = class(obj,'hmtop',hmanifold);
  if isa(arg,'hmtop'),
    if ~isempty(arg.shape);
      obj.shape = arg.shape;
    end;
  elseif dmisinteger(arg),
    obj.shape = lase(arg); 
  elseif isa(arg,'lase'),
    obj.shape = arg;
  else,
    error('Function called with illegal arguments!');
  end;
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;

