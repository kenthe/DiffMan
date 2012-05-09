function obj = laun(varargin)
% LAUN - Constructor for the Lie algebra LAUN.
% function obj = laun(varargin)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

%superiorto('lgun');

if nargin == 0,				% No arguments: Default constructor.
  obj.field = 'C';
  obj.shape = [];
  obj.data  = [];
  obj = class(obj,'laun',liealgebra);
  return;
end;

arg1 = varargin{1};
if nargin == 1,				% Single argument
  if isa(arg1,'laun'),			% Same class: Copy constructor.
    obj = arg1;
    return;
  elseif dmisinteger(arg1),		% Integer: obj with shape = arg1.
    obj.field = 'C';
    obj.shape = arg1;
    obj.data  = [];
    obj = class(obj,'laun',liealgebra);
    return;
  end;
end;
 
arg2 = varargin{2};
if nargin == 2,                         % Two arguments.
  if (dmisinteger(arg1) & isstr(arg2)),
    if strcmp(arg2,'C'),
      obj.field = arg2;
      obj.shape = arg1;
      obj.data  = [];
      obj = class(obj,'laun',liealgebra);
      return;
    else,
      error('The number field must be ''C''!');
    end;
  end;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
