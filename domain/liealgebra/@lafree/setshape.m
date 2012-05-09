function [] = setshape(a,shape)
% SETSHAPE - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

if (nargin ~= 2)|(nargout ~= 0),
  error('Wrong number of input/output arguments!');
end;

name = inputname(1);
if isempty(name),
   error('First argument to set must be a named variable')
end

% Check if shape data is ok.
sh = shape{1};
if ~(all(size(sh)==[1,2])),
   error('Shape{1} is not 1-by-2 vector.');
end;
if ~(all(dmisinteger(sh))),
   error('Shape{1} is not integer array.');
end;
if length(shape)==1,
   shape{2} = ones(1,sh(1));
end;
% bdeg : degree of basis elements
bdeg = shape{2};
if ~(all(dmisinteger(bdeg))),
   error('Shape{2} is not integer array.');
end;
if ~(all(bdeg>0)),
   error('Shape{2} contains nonpositive elements.');
end;
if ~(all(size(bdeg)==[1,sh(1)])),
   error('Shape{2} is not a vector of size [1,s], where s is the no. of free elements.');
end;

% if necessary, compute data for this shape
id = lafreeinit(shape);
a.lafreedata = id; % data about free liealgebra
a.shape = shape;

% set data empty
a.weights = [];
a.commtab = [];

% Finally, assign a in caller's workspace
assignin('caller',name,a);
return;
