function [x,y] = lafpolar(ord)
% LAFPOLAR - polar decomposition in free liealgebra
%    [X,Y] = LAFPOLAR(N) returns the N-dimeansional vectors X, Y, whose 
%    i-th component is the i-th coefficient in the series expansion of the 
%    functions X(t) and Y(t) arising in the polar decomposition on Lie groups.
%
%  See also XPOLAR, YPOLAR, NBCH.


% Written by: H. Munthe-Kaas, March 2000
% Last modified by: A. Zanna 5.5.2000

b = bch(ord);
laf = lafree({[2,2*ord-1],[1,2]});
b = eval(b,cat(1,basis(laf,1),basis(laf,2)));
% b is now bch formula in graded liealgebra
% find even and odd parts
ev = zero(laf);
od = zero(laf);
v = getvector(b);
vo = zeros(size(v));
ve = vo;
for i = 1:dimension(laf),
	bas = basis(laf,i);
	if iseven(order(bas)),
		ve(i) = v(i);
	else,
		vo(i) = v(i);
	end;
end;
setvector(ev,ve);
setvector(od,vo);
ev = ev - basis(laf,2);
od = od - basis(laf,1);
laf2 = lafree({[2,ord]});
x = basis(laf2,1);
y = basis(laf2,2);
% fixpoint iteration:
for i = 1:ord,
	x = basis(laf2,1) - eval(od,cat(1,x,y));
    y = basis(laf2,2) - eval(ev,cat(1,x,y));
end;
