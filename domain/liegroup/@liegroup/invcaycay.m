function [v] = invcaycay(a)
% INVCAYCAY - Computes the inverse Cayley coordinates of the second kind.
% function [v] = invcaycay(a)

% WRITTEN BY       : Kenth Engø, 1998.11.02
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~isa(a,'liegroup'),			% Type-checking input.
    error('Input is not of type: liegroup');
  end;
end;

% Assumption: This function is generic and handles two cases;
%       Abelian algebra: log(a) = a
%       Matrix algebra : log(a) = logm(a)

%if isabelian(a)				% Abelian case.
%  v = liealgebra(a);
%  vv = getdata(a);
%  setdata(v,vv);
%  return;
%end;
%if hasmatrix(a)				% Matrix case.
%  vm = getmatrix(a);
%  vm = logm(vm);
%  v = liealgebra(a);
%  setdata(v,vm);
%  return;
%end;

error('Function not yet implemented');
%error(['Function not defined in class: ' class(a)]);
return;
