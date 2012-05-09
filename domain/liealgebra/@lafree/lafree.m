function obj = lafree(varargin)
% LAFREE - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

superiorto('double');
% No arguments: Default constructor.
if nargin==0,
  obj.lafreedata = []; 
  obj.shape = [];
  obj.weights = sparse(1,0);
  obj.commtab = [];
  obj = class(obj,'lafree',liealgebra);
  return;
end;
 
arg1 = varargin{1};
% Single argument of same class: Set shape identical, weights empty.
if nargin == 1 & isa(arg1,'lafree'),
  obj.lafreedata = arg1.lafreedata; 
  obj.shape = arg1.shape;
  obj.weights = [];
  obj.commtab = [];
  obj = class(obj,'lafree',liealgebra);
  return;
end;

if nargin == 1;
  obj = lafree;
  setshape(obj,arg1);
  return;
end;

% Other cases: Something is wrong!
error('Function is called with illegal arguments!');
return;
