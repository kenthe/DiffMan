function obj = hmsineeuler(varargin)
% HMSINEEULER - Constructor for HMSINEEULER-objects.
%
% DESCRIPTION:
%   Elements of HMSINEEULER are elements over the dual complex
%   Lie algebra LASU; that is LASU*.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

superiorto('lasu');

if nargin == 0,	
  obj.shape = [];
  obj.data = [];
  obj = class(obj,'hmsineeuler',hmanifold);
  return;
end;

arg = varargin{1};
if nargin == 1,
  obj.shape = [];
  obj.data = [];
  obj = class(obj,'hmsineeuler',hmanifold);
  if isa(arg,'hmsineeuler'),
    if ~isempty(arg.shape);
      obj.shape = arg.shape;
    end;
  elseif dmisinteger(arg),
    if (rem(arg,2) ~= 1)|(arg < 3),
      error('Integer arguments must be odd >= 3!');
    end;
    obj.shape = lasu(arg^2-1,'C'); 
  elseif isa(arg,'lasu'),
    shsh = sqrt(getshape(arg)+1);
    if (rem(shsh,2) ~= 1)|(shsh < 3),
      error('Object must have a shape of the form n^2-1, n >= 3!');
    end;
    obj.shape = arg;
  else,
    error('Function called with illegal arguments!');
  end;
  return;
end;

% Other cases: Something is wrong!
error('Function called with illegal arguments!');
return;

