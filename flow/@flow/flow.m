function obj = flow(varargin)
% FLOW - Constructor for the flow class.

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.03.05

if (nargin == 0),
  %%%%%%%% Put default values in the struct 'default' %%%%%%%%%%%%%%
  % Variable stepsize
  default.small = 0.5;       % alpha_small
  default.large = 2.0;       % alpha_large
  default.pessimist = 0.9;   % alpha_pessimist
  default.accept = 1.2;      % alpha_accept
  default.tol = 1.0e-6;      % default tolerance
  default.hmax = 1.0;        % maximal stepsize allowed
  % Flowtools
  default.newexact = 1;      % compute exact solution again
  default.numstep = 8;       % number of stepsize halvings
  default.tstart = 0.0;      % default start time
  default.tend = 1.0;        % default end time
  default.stepsize = 2.0;    % default stepsize
  default.local = 10;        % default stepsize for local approximation
                             %      h/default.local
  default.global = 10;       % default stepsize for global approximation
                             %      h/default.global
  default.disp = 1;          % print messages and result to the screen
  %%%%%%%% Set obj.defaults equal to the struct 'default' %%%%%%%%%%
  obj.defaults = default;
  obj.timestepper = tsrkmk;     % Default timestepper.
  obj.vectorfield = [];         % User must assign the vector field. 
  obj = class(obj,'flow');
  return;
end;

if (nargin == 1),			% One input argument.
  arg = varargin{1};
  if strcmp(class(arg),'flow'),		% Input = flow => Copy constructor.
    obj = arg; return;
  elseif isa(arg,'timestepper'),
    obj = flow;
    obj.timestepper = arg; return;
  elseif strcmp(class(arg),'vectorfield'),
    obj = flow;
    obj.vectorfield = arg; return;
  else 
    error('Illegal arguments!');
    return;
  end;
end;

if (nargin == 2),
  arg1 = varargin{1};
  arg2 = varargin{2};
  if (isa(arg1,'timestepper') & strcmp(class(arg2),'vectorfield')),
    obj = flow;
    obj.timestepper = arg1;
    obj.vectorfield = arg2;
    return;
  elseif (isa(arg2,'timestepper') & strcmp(class(arg1),'vectorfield')),
    obj = flow;
    obj.timestepper = arg2;
    obj.vectorfield = arg1;
    return;
  else 
    error('Illegal arguments!');
    return;
  end;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;
