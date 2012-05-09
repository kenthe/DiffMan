function v = cay(lgr,a)
% CAY - Computes the Cayley transform from Lie algebra to Lie group. 
% function v = cay(lgr,a)
%
% Assumption: This function is generic and handles two cases;
%       Abelian algebra: cay(lgr,a) = a       
%       Matrix algebra : cay(lgr,a) = (1+a/2)*(1-a/2)^(-1)

% WRITTEN BY       : Kenth Engø, 1998.02.02
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liealgebra'),
    error('Second argument is not of type: liealgebra');
  end;
end;

v = liegroup(a);
if isabelian(a)			        % Abelian case.
  vv = getvector(a);
  setvector(v,vv);
  return;
end;
if hasmatrix(a),			% Matrix case.
  n = getshape(a);
  u = getmatrix(a);
  vm = (eye(n)+u/2)*inv(eye(n)-1/2*u);
  setmatrix(v,vm);
  return;
end;

% ... Don't know how to compute the Cayley transform ...
error(['Function not defined in class: ' class(lgr)]);
return;

