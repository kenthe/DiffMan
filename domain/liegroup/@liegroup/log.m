function [v] = log(a)
% LOG - Computes the logarithm from the Lie group to the Lie algebra.
% function [v] = log(a)
% 
% Assumption: This function is generic and handles two cases;
%       Abelian algebra: log(a) = a
%       Matrix algebra : log(a) = logm(a)
%
% Special case: In DiffMan we conveniently treat a Lie algebra as a
%               Lie group/vector space with addition as group
%               operation. Hence, if log receives an object from a
%               liealgebra as argument, log act as the identity function.

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 2000.03.28

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liegroup'),			% Type-checking input.
    error('Input is not of type: liegroup');
  end;
end;

if isa(a,'liealgebra'),
  v = a; return;
end;

if isabelian(a)				% Abelian case.
  v = liealgebra(a);
  vv = getdata(a);
  setdata(v,vv);
  return;
end;
if hasmatrix(a)				% Matrix case.
  vm = getmatrix(a);
  vm = logm(vm);
  v = liealgebra(a);
  setdata(v,vm);
  return;
end;

% ... Don't know how to compute the logarithm ...
error(['Function not defined in class: ' class(a)]);
return;
