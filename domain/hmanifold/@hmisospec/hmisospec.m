function obj = hmnsphere(varargin)
% HMISOSPEC - Constructor for HMISOSPEC-objects.
% function obj = hmnsphere(varargin)
%
% DESCRIPTION:
%      Isospectral flows evolve on an open subset of R^(nxn) (Our domain 
%      manifold) and are characterized by the conservation of the spectrum
%      of the matrix. We model this as an homogeneous manifold by
%      considering the action lambda: (v,A) -> exp(v) A exp(-v) of laso on
%      our open subset of R^(nxn).

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

superiorto('laso');

if nargin == 0,
  obj.shape = [];
  obj.data = [];
  obj = class(obj,'hmisospec',hmanifold);
  return;
end;

arg1 = varargin{1};
% Single argument of same class: Copy constructor
if nargin == 1,
  obj.shape = []; obj.data = [];
  obj = class(obj,'hmisospec',hmanifold);
  if strcmp(class(arg1),'hmisospec'),
    if ~isempty(arg1.shape), 		% Copy shape-info if non-empty.
      obj.shape = arg1.shape;
    end;
  elseif strcmp(class(arg1),'laso'),        % Input is a 'laso' - object.
    obj.shape = arg1;
  elseif dmisinteger(arg1),		% Integer input.
    la = laso(arg1);
    obj.shape = la;
  else,
    error('Function called with illegal arguments!');
  end;
  return;
end;

% Other cases: Something is wrong!
error('Function is called with illegal arguments!');
return;

