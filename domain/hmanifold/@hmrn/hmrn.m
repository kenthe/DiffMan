function obj = hmrn(varargin)
% HMRN - Constructor for HMRN-objects.
% function obj = hmrn(varargin)
%
% DESCRIPTION:
%      All Lie algebras act on R^n by matrix multiplication: 
%      (v,w) -> exp(v)*w.

% WRITTEN BY       : Kenth Engø, 1997.11.10
% LAST MODIFIED BY : Kenth Engø, 1999.04.13

superiorto('liealgebra','ladirprod','lagl','larn','lase','lasl');
superiorto('laso','lasp','lasu','laun','laso_pq');

if nargin == 0,
  obj.shape = [];
  obj.data = [];
  obj = class(obj,'hmrn',hmanifold);
  return;
end;

arg = varargin{1};
if (nargin == 1),
  obj.shape = []; obj.data = [];
  obj = class(obj,'hmrn',hmanifold);
  if strcmp(class(arg),'hmrn'),  % Single arg. of same class: Copy constructor!
    if ~isempty(arg.shape), 		% Copy shape-info if non-empty.
      obj.shape = arg.shape;
    end;
  elseif isa(arg,'liealgebra'),
    obj.shape = arg;    
  else,
    error('Function is called with illegal arguments!');
  end;
  return;
end;

% Other cases: Something is wrong!
error('Function is called with illegal arguments!');
return;

