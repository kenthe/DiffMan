function [id] = identity(a)
% IDENTITY - Returns the identity object in the Lie group of a.
% function [id] = identity(a)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

sh = getshape(a);
id = liegroup(a);
if hasmatrix(a),			% Matrix case.
  setdata(id,eye(sh));
  return;
end;
if isabelian(a),			% Assume vector repr. then!
  setdata(id,zeros(sh,1));
  return;
end;

% ... Don't know how to make the identity element ...
error(['Function not defined in class: ' class(a)]);
return;
