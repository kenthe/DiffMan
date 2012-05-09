function [] = setdata(a,v)
% SETVECTOR - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 2)|(nargout ~= 0),
  error('Wrong number of input/output arguments!');
end;

name = inputname(1);
if isempty(name),
   error('First argument to set must be a named variable')
end

a.weights = sparse(dimension(a),1);
a.weights(1:length(v)) = v;
a.weights(length(v)+1:length(a.weights))=0;
a.commtab = [];

% Finally, assign a in caller's workspace
assignin('caller',name,a);
return;
