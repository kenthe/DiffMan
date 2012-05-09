function [c] = horzcat(a,b)
% HORZCAT - Commutator in Lie algebra.
% function [c] = horzcat(a,b)
%
% Signature:                       Matlab decleration:
%    HORZCAT : g x g -> g             function [c] = horzcat(a,b);

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(a,b),
    error('Arguments are not in same algebra!');
  end;
end;

if isabelian(a),			% Abelian algebras
   c = zero(a);
   return;
end;

if hasmatrix(a),			% Algebras with matrix repr.
   ma = getmatrix(a);
   mb = getmatrix(b);
   mc = ma*mb-mb*ma;
   c = a;
   setmatrix(c,mc);
   return;
end;

% Here we dont know how to compute the comutator. 
error(['Function not defined in class: ' class(a)]);
return;
