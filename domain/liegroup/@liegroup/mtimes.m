function [c] = mtimes(a,b)
% MTIMES - The binary operation of two elements in the Lie group.
% function [c] = mtimes(a,b)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 2000.04.23

global DMARGCHK

if DMARGCHK
  if ~sameshape(a,b),
    error('Input arguments is not of same class!');
  end;
end;

c = liegroup(a);
data = getdata(a);
datb = getdata(b);

if isabelian(a),			% Abelian case. (vector case!)
  if ~(isempty(data)|isempty(datb)),
    cd = data + datb;	% Vector addition.
    setdata(c,cd);
  else,
    setdata(c,[]);
  end;
  return;
end;
if hasmatrix(a),			% Matrix case.
  if ~(isempty(data)|isempty(datb)),
    cd = data*datb;		% Matrix multiplication.
    setdata(c,cd);
  else,
    setdata(c,[]);
  end;
  return;
end;

% ... Don't know how to compute a*b ....
error(['Function not defined in class: ' class(a)]);
return;
