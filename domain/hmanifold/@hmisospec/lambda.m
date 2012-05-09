function [v] = lambda(a,m,coord)
% LAMBDA - The action of an object in laso on HMISOSPEC-object.
% function [v] = lambda(a,m,coord)
% 
% INPUT:
%         'a'     - Group/algebra-object.
%         'm'     - HMLIE-object.
%         'coord' - Coordinates used on the Lie group.

% WRITTEN BY       : Kenth Engø, 1997.11.09
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~strcmp('laso',class(a)),
    error('Input algebra object not of correct class!');
  end;
end;

mat1 = getdata(feval(coord,lgso,a));
mat2 = getdata(feval(coord,lgso,-a));
v = hmisospec(m);
v.data = mat1*(m.data)*mat2;
return;
