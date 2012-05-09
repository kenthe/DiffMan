function [c] = inv(a)
% INV - The invers of an element in the Lie group.
% function [c] = inv(a)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isabelian(a),			% Abelian case. (vector case!)
  c = liegroup(a);
  cd = -getdata(a);			% the negative vector.
  setdata(c,cd);
  return;
end;
if hasmatrix(a),			% Matrix case.
  c = liegroup(a);
  cd = inv(getdata(a));			% the matrix inverse.
  setdata(c,cd);
  return;
end;

% ... Don't know how to compute the inverse of a ....
error(['Function not defined in class: ' class(a)]);
return;
