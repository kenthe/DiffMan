function [v] = lambda(a,m,coord)
% LAMBDA - The _LEFT_ action of an Lie group/algebra element
% function [v] = lambda(a,m,coord)
% 
% INPUT:
%         'a'     - Group/algebra-object.
%         'm'     - HMLIE-object.
%         'coord' - Coordinates used on the Lie group.

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liealgebra'),
    error('First input object is not a liealgebra object!');
  end;
end;

v = hmlie(m);
sh = m.shape;

if strcmp(class(a),'latangent')|strcmp(class(a),'ladirprod'),
  obj = feval(coord,sh,a);
  mobj = obj;
  setdata(mobj,m.data);
  v.data = getdata(obj*mobj);
else
  if hasmatrix(sh),
    obj = feval(coord,sh,a);
    v.data = getdata(obj)*m.data;
  else
    v.data = getdata(a) + m.data;
  end;
end;
return;
