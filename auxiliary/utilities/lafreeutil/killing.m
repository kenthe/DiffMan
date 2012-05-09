function [k] = killing(u,v)
% KILLING - Killing form on a Lie algebra
%
% [k] = killing(u,v)
%
% Definition: A killing form on a Lie algebra is a symmetric 2-form
%    defined by:
%
%    killing(u,v) == trace(ad(u) o ad(v)),
%
%    where ad(u)(w) = [u,w]
%
% If g is the Lie algebra of a semisimple compact group (ex. so(n)), 
% the Killing form is negative definite.
% Otherwise it may be indefinite (ex. gl(n)), or 0 (ex. r(n)).

% Written by: Hans Munthe-Kaas, 1997.11.04

if ~sameshape(u,v),
   error('The arguments do not belong to the same Lie algebra.');
end;

d = dimension(u);
k = 0;
for i = 1:d,
   e = basis(u,i);
   w = [u,[v,e]];
   vec = getvector(w);
   k = k + vec(i);
end;
return;