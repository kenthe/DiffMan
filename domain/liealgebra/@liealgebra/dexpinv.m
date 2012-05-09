function [v] = dexpinv(a,b,ord)
% DEXPINV - The ord'th order approximation of the inverse differential of exp.
% function [v] = dexpinv(a,b,ord)
%
% v = b -1/2[a,b]+1/12[a,[a,b]]-1/720[a,[a,[a,[a,b]]]] ...
%
% ord counts the length of the longest commutator, the approx above
% has order 5 (or 6, since the next term has 7 terms).
%
% Note: dexpinv is implemented up to order 12.

% WRITTEN BY       : Hans Munthe-Kaas 1997 Feb.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

if DMARGCHK
  if ~sameshape(a,b),
    error('Arguments are not in the same Lie algebra!');
  end;
end;

v = b;
if isabelian(a),			% Abelian Lie algebras
  return;
else,	         	                % Non-Abelian Lie algebras.
  if ord < 2, return; end;
  c = [a,b]; v = v - 1/2*c; if ord < 3, return; end;
  c = [a,c]; v = v + 1/12*c; if ord < 5, return; end;
  c = [a,[a,c]]; v = v - 1/720*c; if ord < 7, return; end;
  c = [a,[a,c]]; v = v + 1/30240*c; if ord < 9, return; end;
  c = [a,[a,c]]; v = v - 1/1209600*c; if ord < 11, return; end;
  c = [a,[a,c]]; v = v + 5/239500800*c; if ord < 13, return; end;
  error('Sorry, dexpinv is only implemented up to order 12.');
end;
return;
