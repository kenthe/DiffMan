function obj = vectorfield(varargin)
% VECTORFIELD - Constructor for the vector field class.
% function obj = vectorfield(varargin)

% WRITTEN BY       : Kenth Engø, 1998.06.03
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

if (nargin == 0),
  obj.domain  = [];
  obj.eqntype = 'G';
  obj.fm2g    = [];
  obj = class(obj,'vectorfield');
  return;
end;

if (nargin == 1),			% One input argument.
  arg = varargin{1};
  if strcmp(class(arg),'vectorfield'),	% Vectorfield obj. => Copy constructor.
    obj = arg; return;
  elseif isa(arg,'hmanifold'),
    obj = vectorfield;
    obj.domain = arg; return;
  else 
    error('Illegal arguments!');
    return;
  end;
end;

n = nargin;
obj = struct(vectorfield);		% 'Un-class' the flow-obj. -> struct
if ((n == 2)|(n == 4)),
  for i = 1:2:n-1
    if (isfield(obj,varargin{i}) & ischar(varargin{i+1})),
      obj = setfield(obj,varargin{i},varargin{i+1});   % Set the correct field.
    else 
      error('Illegal input values: Not field name or not string)');
    end;
  end;
  obj = class(obj,'vectorfield');	% 'Re-class' the struct to vectorfield.
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
