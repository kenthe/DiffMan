function [obj] = ladirprod(varargin)
% LADIRPROD - Constructor for direct products of Lie algebras. 
% function [obj] = ladirprod(varargin)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

%superiorto('lgdirprod');

% No arguments: Default constructor.
if nargin == 0,
  obj.n      = 0;
  obj.shape  = {};			% Initialize empty cell arrays.
  obj.data   = {};
  obj = class(obj,'ladirprod',liealgebra);
  return;
end;

arg1 = varargin{1};
% Single argument of same class: Copy constructor. Discards data.
if (nargin == 1) & isa(arg1,'ladirprod'),
  obj = arg1;                    % Copy 'shape'-info. & 'n'-info.
  for i = 1:length(obj),
    obj(i).data = cell(obj.n,1);      % Init. data 2 empty cell vector.
  end;
  return;
end;

% Two or more arguments: two cases.
if nargin >= 2,
  if (nargin == 2) & isa(arg1,'liealgebra') & dmisinteger(varargin{2}), 
    if ~(varargin{2} > 0),
      error('Second argument must be a positive integer!');
    end;
    obj.n = varargin{2};    
    obj.shape = { 'ladirprod' cell(obj.n,2)};
    arg = varargin{1};
    if hasshape(arg),           % The Lie algebra does have shapes.
      sh = getshape(arg(1));
      if ~iscell(sh),           % Matrix Lie algebra objects.
        if ~isempty(sh),
          obj.shape{2}{1,1} = class(arg);
          obj.shape{2}{1,2} = sh;
        else
          error('No pre-set shape information in first argument.');
        end;
      else      % functorial objects; dirprod,tangent, semdirprod, etc.
        obj.shape{2}{1,1} = sh{1};
        obj.shape{2}{1,2} = sh{2};
      end;    
    else                            % No shape.
      obj.shape{2}{1,1} = class(arg);
    end;
    for i = 2:obj.n,
      obj.shape{2}{i,1} = obj.shape{2}{1,1};
      obj.shape{2}{i,2} = obj.shape{2}{1,2};
    end;
    obj.data    = cell(obj.n,1);
    dat = getdata(arg);
    for i = 1:obj.n,
      obj.data{i} = dat;
    end;
    obj = class(obj,'ladirprod',liealgebra);
    return;
  else,
    obj.n = nargin;
    veclen = 1;
    for i = 1:obj.n,    % Test if all input is 'liealgebra's.
      if ~isa(varargin{i},'liealgebra'),
        error('Not all input objects are liealgebra-objects!');       
      end;
      if length(varargin{i}) > 1,
        veclen = max([veclen; length(varargin{i})]);
      end;
    end;
    obj.shape = { 'ladirprod' cell(obj.n,2)};
    for i = 1:obj.n,
      arg = varargin{i};
      if hasshape(arg),           % The Lie algebra does have shapes.
        sh = getshape(arg(1));
        if ~iscell(sh),           % Matrix Lie algebra objects.
          if ~isempty(sh),
            obj.shape{2}{i,1} = class(arg);
            obj.shape{2}{i,2} = sh;
          else
	    error(['No pre-set shape information in ' int2str(i) '''th argument.']);
          end;
        else      % functorial objects; dirprod,tangent, semdirprod, etc.
          obj.shape{2}{i,1} = sh{1};
          obj.shape{2}{i,2} = sh{2};
        end;      
      else                            % No shape.
        obj.shape{2}{i,1} = class(arg);
      end;
    end;
    obj.data    = cell(obj.n,1);
    for i = 1:obj.n,
      obj.data{i} = getdata(varargin{i}(1));
    end;
    obj = class(obj,'ladirprod',liealgebra);
    if (veclen > 1),
      objtmp(veclen) = obj;
      for i = 1:veclen-1,
        objtmp(i) = obj;
      end;
      obj = objtmp;
    end;
    return;
  end;  
end;

% Other cases: Illigal input.
error('Function is called with illegal arguments!');
return;
