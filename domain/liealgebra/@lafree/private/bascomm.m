function [v] = bascomm(id,i,j)
% BASISVEC2STR - Diffman: LIEALGEBRA class LAFREE private function
%        Commute basis element i with basis element j in free algebra 
%        with identity id.
%
%        Returns a sparse vector of weights

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Eng¯, 1997.11.12

if (nargin ~= 3)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
sh = LAFREEDATA(id).shape;
sh = sh{1};
s1 = sh(1);
s2 = sh(2);
dim = LAFREEDATA(id).dim;
if i==j,
  v = sparse(dim,1);
  return;
end;
%
if LAFREEDATA(id).basorder(i) + LAFREEDATA(id).basorder(j) > s2,
  v = sparse(dim,1);
  return;
end;
%
if i>j,
  v = -bascomm(id,j,i);
  return;
end;
% is result already computed?
comm = LAFREEDATA(id).commtab(i,j);
if comm>0, % result is another basis vector
  v = sparse(dim,1);
  v(comm) = 1;
  return;
end;
if comm<0, % minus indicate that result is computed and stored before
  v = LAFREEDATA(id).commres(:,-comm);
  return;
end;
% finally, we have to compute the result by using the Jacobi rule
j1 = LAFREEDATA(id).basiscomp(j,1);
j2 = LAFREEDATA(id).basiscomp(j,2);
v = sparse(dim,1);
v1 = bascomm(id,i,j2);
for pos = find(v1)',
  v = v + v1(pos)*bascomm(id,j1,pos);
end;
v1 = bascomm(id,i,j1);
for pos = find(v1)',
  v = v - v1(pos)*bascomm(id,j2,pos);
end;
% store result
pos = size(LAFREEDATA(id).commres,2)+1;
LAFREEDATA(id).commres(:,pos) = v;
LAFREEDATA(id).commtab(i,j) = -pos;
return;
