function v = pade22(lgr,a)
% PADE22 - Computes the (2,2) Pade' approximation of the exponential.
% function v = pade22(lgr,a)
%
% Assumption: This function is generic and handles two cases;
%       Abelian algebra : pade22(lgr,a) = a;
%       Matrix algebra  : pade22(lgr,a) = (1+a/2+a^2/12)*(1-a/2+a^2/12)^(-1)

% WRITTEN BY       : Kenth Engø, 1998.06.16
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
  Id = eye(n);
  vm = (Id + u/2 + u^2/12)*inv(Id - u/2 + u^2/12);
  setmatrix(v,vm);
  return;
end;

% ... Don't know how to compute the coordinate transform ...
error(['Function not defined in class: ' class(lgr)]);
return;

