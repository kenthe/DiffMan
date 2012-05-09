function [obj] = lgdirprod(varargin)
% LGDIRPROD - Constructor for LGDIRPROD.
% function [obj] = lgdirprod(varargin)

% WRITTEN BY       : Kenth Engø, 1997 Nov.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

% No arguments: Default constructor.
if nargin == 0,
  obj.n      = 0;
  obj.shape  = {};			% Initialize empty cell arrays.
  obj.data   = {};
  obj = class(obj,'lgdirprod',liegroup);
  return;
end;

arg = varargin{1};
% Single argument of same class: Copy constructor. Discards data.
if nargin == 1 & isa(arg,'lgdirprod'),
  obj = arg;                     % Copy 'shape'-info. & 'n'-info.
  for i = 1:length(obj),
    obj(i).data = cell(obj(1).n,1);   % Init. data 2 empty cell vector.
  end;
  return;
end;

% Two or more arguments: two cases.
if nargin >= 2,
  if (nargin == 2) & isa(varargin{1},'liegroup') & dmisinteger(varargin{2}), 
    if ~(varargin{2} > 0),
      error('Second argument must be a positive integer!');
    end;
    obj.n = varargin{2};    
    obj.shape = { 'lgdirprod' cell(obj.n,2)};
    arg = varargin{1};
    if hasshape(arg),           % The Lie group does have shapes.
      sh = getshape(arg);
      if ~iscell(sh),           % Matrix Lie group objects.
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
    obj = class(obj,'lgdirprod',liegroup);
    return;
  else,
    obj.n = nargin;
    for i = 1:obj.n,    % Test if all input is 'liegroup's.
      if ~isa(varargin{i},'liegroup'),
        error('Not all input objects are liegroup-objects!');       
      end;
      if length(varargin{i}) ~= 1,
        error('Constructor does not support vectors of input objects.');
      end;
    end;
    obj.shape = { 'lgdirprod' cell(obj.n,2)};
    for i = 1:obj.n,
      arg = varargin{i};
      if hasshape(arg),           % The Lie group does have shapes.
        sh = getshape(arg);
        if ~iscell(sh),           % Matrix Lie group objects.
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
      obj.data{i} = getdata(varargin{i});
    end;
    obj = class(obj,'lgdirprod',liegroup);
    return;
  end;  
end;

% Other cases: Illigal input.
error('Function is called with illegal arguments!');
return;
