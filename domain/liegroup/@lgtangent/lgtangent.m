function [obj] = lgtangent(varargin)
% LGTANGENT - Constructor for LGTANGENT.
% function [obj] = lgtangent(varargin)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

% No arguments: Default constructor.
if nargin == 0,
  obj.shape  = {[]{}};
  obj.data   = {{}{}};
  obj = class(obj,'lgtangent',liegroup);
  return;
end;

arg = varargin{1};
if (nargin == 1)&(isa(arg,'liegroup')), % Arbitrary LG object as input.
  if strcmp(class(arg),'lafree'),
    disp('Sorry: LGTANGENT does not handle LAFREE objects yet -- DDT.');
    return;
  end;
  if hasshape(arg),
    if ~isempty(getshape(arg)),
      obj.shape = {class(arg), getshape(arg)};
      obj.data  = {getdata(identity(arg)), getdata(zero(liealgebra(arg)))};
      obj = class(obj,'lgtangent',liegroup);
      return;
    else,
      disp('Argument not accepted: Set the shape information!');
      return;
    end;
  else,
    disp('ERROR in lgtangent.m: How to handle args with no shape!');
    return;
  end;
end;

n = varargin{2};    
if (nargin == 2) & isa(arg,'liegroup') & dmisinteger(n), 
  if ~(n > 0),
    error('Second argument must be a positive integer!');
  end;
  obj.shape = cell(1,2);
  if hasshape(arg),           % The Lie group has a shape.
    sh = getshape(arg);
    if ~iscell(sh),           % Matrix Lie group objects.
      if ~isempty(sh),
        obj.shape{1,1} = class(arg);
        obj.shape{1,2} = sh;
      else
        error('No pre-set shape information in first argument.');
      end;
    else      % functorial objects; dirprod, tangent, semdirprod, etc.
      obj.shape{1,1} = sh{1};
      obj.shape{1,2} = sh{2};
    end;    
  else                            % No shape.
    obj.shape{1,1} = class(arg);
  end;
  obj.data  = {getdata(identity(arg)), getdata(zero(liealgebra(arg)))};
  for i = 1:n-1,
    obj.shape{2} = obj.shape;
    obj.shape{1} = 'lgtangent';
    obj.data     = {obj.data {obj.data{2} obj.data{2}}};
  end;
  obj = class(obj,'lgtangent',liegroup);
  return;
end;

% Other cases: Illegal input.
error('Function is called with illegal arguments!');
return;
