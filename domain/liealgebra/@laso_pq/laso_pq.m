function obj = laso_pq(varargin)
% LASO_PQ - Constructor for the special pseudo-orthogonal Lie algebra LASO_PQ.
% function obj = laso_pq(varargin)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

%superiorto('lgso_pq');

if nargin == 0,				% No arguments: Default constructor.
  obj.field = 'R';
  obj.shape = [];
  obj.data  = [];
  obj = class(obj,'laso_pq',liealgebra);
  return;
end;

arg1 = varargin{1};
if nargin == 1,				% Single argument
  if isa(arg1,'laso_pq'),		% Same class: Copy constructor.
    obj = arg1;
    return;
  elseif dmisinteger(arg1) & (length(arg1) == 2) & all(arg1 > 0),
    obj.field = 'R';
    obj.shape = arg1;
    obj.data  = [];
    obj = class(obj,'laso_pq',liealgebra);
    return;
  else,
    error('Argument must be an LASO_PQ object or a positive integer 2-vector!');
  end;
end;
 
arg2 = varargin{2};
if nargin == 2,                         % Two arguments.
  if dmisinteger(arg1) & isstr(arg2) & (length(arg1) == 2) & all(arg1 > 0),
    if strcmp(arg2,'R'),
      obj.field = arg2;
      obj.shape = arg1;
      obj.data  = [];
      obj = class(obj,'laso_pq',liealgebra);
      return;
    else,
      error('The number field must be ''R''!');
    end;
  else,
    error('Arg. 1 must be a positive integer 2-vector, and arg. 2 must be ''R''!');
  end;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
