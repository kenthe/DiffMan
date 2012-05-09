function [v] = exp(lgr,a)
% EXP - Computes the exponential from the Lie algebra to the Lie group.
% function [v] = exp(lgr,a)
% 
% Assumption: This function is generic and handles two cases;
%       Abelian algebra: exp(lgr,a) = a
%       Matrix algebra : exp(lgr,a) = expm(a)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liealgebra'),
    error('Second input argument is not of type: liealgebra');
  end;
end;

v = liegroup(a);
if isabelian(a)			% Abelian case.
  vv = getvector(a);
  setvector(v,vv);
  return;
end;
if hasmatrix(a)			% Matrix case.
  vm = getmatrix(a);
  vm = expm(vm);
  setmatrix(v,vm);
  return;
end;
  
% ... Don't know how to compute the exponential ...
error(['Function not defined in class: ' class(lgr)]);
return;
