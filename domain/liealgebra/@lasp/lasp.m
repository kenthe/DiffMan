function obj = lasp(varargin)
% LASP - Constructor for the symplectic Lie algebra LASP.
% function obj = lasp(varargin)     

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯-Monsen, 2012.04.24

%superiorto('lgsp');

if nargin == 0,
  obj.field = 'R';                      % Default number field: R.
  obj.shape = [];
  obj.data  = [];
  obj = class(obj,'lasp',liealgebra);
  return;
end;

arg1 = varargin{1};
if nargin == 1,				% Single argument
  if isa(arg1,'lasp'),			% Same class: Copy constructor.
    obj = arg1;
    return;
  elseif dmisinteger(arg1),		% Integer: obj with shape = arg1.
    if mod(arg1,2) == 0, 
      obj.field = 'R';                    % Default number field: R.
      obj.shape = arg1;
      obj.data  = [];
      obj = class(obj,'lasp',liealgebra);
      return;
    else,
      error('Input is not a positive even integer.');
    end;
  end;
end;
 
arg2 = varargin{2};
if nargin == 2,                         % Two arguments.
  if (dmisinteger(arg1) & isstr(arg2)),
    if ((strcmp(arg2,'R') | strcmp(arg2,'C')) & mod(arg1,2) == 0),
      obj.field = arg2;
      obj.shape = arg1;
      obj.data  = [];
      obj = class(obj,'lasp',liealgebra);
      return;
    else
      error('Is the size an even integer, and is the field ''R'' or ''C''?');
    end;
  end;
end;

% Other cases: Something is wrong!
error('Function is called with illegal arguments!');
return;
