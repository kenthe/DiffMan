function obj = hmlie(varargin)
% HMLIE - Constructor for HMLIE-objects.
% function obj = hmlie(varargin)
%
% DESCRIPTION:
%      All Lie groups and Lie algebras (Lie algebras are Lie groups with
%      respect to addition in the vectorstructure of the algebra.) act on
%      them self by the group multiplication (addition for the algebras). 

% WRITTEN BY       : Kenth Engø, 1997.10.28
% LAST MODIFIED BY : Kenth Engø, 1999.04.13

superiorto('liealgebra','ladirprod','lagl','larn','lase','lasl');
superiorto('latangent','laso','lasp','lasu','laun','laso_pq');

if nargin == 0,
  obj.shape = [];
  obj.data = [];
  obj = class(obj,'hmlie',hmanifold);
  return;
end;

arg = varargin{1};
if (nargin == 1) 
  if strcmp(class(arg),'hmlie'),
    obj.shape = []; obj.data = [];
    obj = class(obj,'hmlie',hmanifold);
    if ~isempty(arg.shape), 		% Copy shape-info if non-empty.
      obj.shape = arg.shape;
    end;
    return;
  elseif (isa(arg,'liegroup')|isa(arg,'liealgebra')),
    if (hasshape(arg)&isempty(getshape(arg))),
      error('Shape object contains no shape information!');
    end;
    if strcmp(class(arg),'lgtangent'),
      setdata(arg,cell(2,1));
    elseif strcmp(class(arg),'lgdirprod'),
      shsh = getshape(arg);
      n = size(shsh{2},1);
      setdata(arg,cell(1,n));
    else 
      setdata(arg,[]);
    end;
    obj.shape = arg;      % Set whole object as hmlie-shape.
    obj.data = [];
    obj = class(obj,'hmlie',hmanifold);
    return;
  end;
end;

% Other cases: Something is wrong!
error('Illegal arguments!');
return;

