function [v] = lambda(a,m,coord)
% LAMBDA - The action of an element in laso on m in the N-sphere.
% function [v] = lambda(a,m,coord)
% 
% INPUT:
%         'a'     - Group/algebra-object.
%         'm'     - HMLIE-object.
%         'coord' - Coordinates used on the Lie group.

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~strcmp('laso',class(a)),
    error('Input algebra object not of correct class!');
  end;
end;

mat = getdata(feval(coord,lgon,a));
vec = m.data;
v = hmnsphere(m);
v.data = mat*vec;
return;
