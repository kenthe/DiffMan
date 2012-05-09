function [lnxt] = nextpartition(l)

%  NEXTPARTITION  determining the next partition of N elements summing to K 
%    given partition
%    P2 = NEXTPARTITION(P1) returns an N-dimensional vector so that the 
%    partition P2 is the successor of P1. Note that SUM(P2) = SUM(P1).
%
%    This file is an useful routine in XPOLAR, YPOLAR, NBCH. 
%   
%    See also FIRSTPARTITION

% Written by: H. Munthe-Kaas, March 2000
% Last modified by: A. Zanna 5.5.2000

tail = l(2:end);
if all(tail==1), % terminate, there is no next
	lnxt = 0;
	return;
end;
% length 2 treated specially
if length(l)==2,
	lnxt = l+[1,-1];
	return;
end;
%
tnxt = nextpartition(tail);
if ~tnxt, % increase first index by one
	lnxt = l;
	lnxt(1) = lnxt(1)+1;
	tnxt = firstpartition(sum(tail)-1,length(tail));
	lnxt(2:end) = tnxt;
else,
	lnxt = l;
	lnxt(2:end) = tnxt;
end;

return;

