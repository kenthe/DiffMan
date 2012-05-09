function [v] = dexpinvtest(a,b,ord)
% DEXPINV - The ord'th order approximation of the inverse differential of exp.
% function [v] = dexpinvtest(a,b,ord)
%
% v = b -1/2[a,b]+1/12[a,[a,b]]-1/720[a,[a,[a,[a,b]]]] ...
%
% ord counts the length of the longest commutator, the approx above
% has order 5 (or 6, since the next term has 7 terms).
%
% Note: dexpinv is implemented up to order 10.
%
% ====================> THIS IS AN EXPERIMENTAL VERSION <================

% WRITTEN BY       : Hans Munthe-Kaas 1998.11.09.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DXPIORD
global DXPIFLA

% can we use old data?
if isempty(DXPIORD)
	newcall = 1;
elseif DXPIORD~=ord,
	newcall = 1;
else,
	newcall = 0;
end;

% compute free liealgebra element
if newcall,
	DXPIFLA = lafree({[2 ord]});
	x1 = basis(DXPIFLA,1);
  x2 = basis(DXPIFLA,2);
  DXPIFLA = x2;
  if ord > 1,
  DXPIFLA = DXPIFLA - (1/2)*[x1,x2]; 
  if ord > 2, 
  DXPIFLA = DXPIFLA + (1/12)*[x1,[x1,x2]];
  if ord > 4,
  DXPIFLA = DXPIFLA - (1/720)*[x1,[x1,[x1,[x1,x2]]]];
  if ord > 6,
  DXPIFLA = DXPIFLA + (1/30240)*[x1,[x1,[x1,[x1,[x1,[x1,x2]]]]]];
  if ord > 8,
  DXPIFLA = DXPIFLA - (1/1209600)*[x1,[x1,[x1,[x1,[x1,[x1,[x1,[x1,x2]]]]]]]];   
  if ord > 10,
  error('Sorry, dexpinv is only implemented up to order 10.');
  end; end; end; end; end; end; 
  DXPIORD = ord;
  % compute commutatortable
  setcommtab(DXPIFLA);
end;

v = eval(DXPIFLA,cat(1,a,b));


return;
