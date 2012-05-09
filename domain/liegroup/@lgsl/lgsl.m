function obj = lgsl(varargin)
% LGSL - Constructor for the Lie group LGSL.
% function obj = lgsl(varargin)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

if nargin == 0,
  obj.field = 'R';                      % Default number field: R.
  obj.shape = [];
  obj.data  = [];
  obj = class(obj,'lgsl',liegroup);
  return;
end;

arg1 = varargin{1};
if nargin == 1,				% Single argument
  if isa(arg1,'lgsl'),			% Same class: Copy constructor.
    obj = arg1;
    return;
  elseif dmisinteger(arg1),		% Integer: obj with shape = arg1.
    obj.field = 'R';                    % Default number field: R.
    obj.shape = arg1;
    obj.data  = [];
    obj = class(obj,'lgsl',liegroup);
    return;
  end;
end;

arg2 = varargin{2};
if nargin == 2,                         % Two arguments.
  if (dmisinteger(arg1) & isstr(arg2)),
    if strcmp(arg2,'R') | strcmp(arg2,'C'),
      obj.field = arg2;
      obj.shape = arg1;
      obj.data  = [];
      obj = class(obj,'lgsl',liegroup);
      return;
    end;
  end;
end;
 
% Other cases: Something is wrong!
error('Function is called with illegal arguments!');
return;
