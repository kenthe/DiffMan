function [v] = dexp(a,b,ord)
% DEXP - The ord'th order approximation of the differential of exp.
% function [v] = dexp(a,b,ord)
% 
% Note: dexp is implementet up to order 8. 

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(a,b),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

v = b;
if isabelian(a),			% Abelian Lie algebras.
  return;
elseif ord > 8				% No need to calculate.
  error('Sorry, dexp is only implemented up to order 8.');
else,             	         	% Non-Abelian Lie algebras.
  if ord < 1, return; end;
  c = [a,b]; v = v + 1/2*c; if ord < 2, return; end;
  c = [a,c]; v = v + 1/6*c; if ord < 3, return; end;
  c = [a,c]; v = v + 1/24*c; if ord < 4, return; end;
  c = [a,c]; v = v + 1/120*c; if ord < 5, return; end;
  c = [a,c]; v = v + 1/720*c; if ord < 6, return; end;
  c = [a,c]; v = v + 1/5040*c; if ord < 7, return; end;
  c = [a,c]; v = v + 1/40320*c; if ord < 8, return; end;
  c = [a,c]; v = v + 1/362880*c; 
end;
return;
