function [ct] = getcommtab(f)
% GETCOMMTAB - Diffman: LIEALGEBRA class LARFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1998.11.05
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.08

if ~isempty(f.commtab),
	ct = f.commtab;
	return;
end;

global LAFREEDATA;
global LONGLIST;  % all commutators in the FLA
global COMMTABLE; % the commutators that must be computed
global GCTNSTO;  % the number of stored elements

fd = freedim(f); % no. of free symbols in the liealgebra
LONGLIST = zeros(size(f.weights));
GCTNSTO = 0;
COMMTABLE = [];
id = getlafdata(f);
for i = find(f.weights)', 
	w = f.weights(i);
	if i <= fd, % no commutation needed, fetch from orig. table
		COMMTABLE = cat(1,COMMTABLE,[0 -i 0 w]);
      LONGLIST(i) = -size(COMMTABLE,1); %computed but not stored
	else,
		i1 = LAFREEDATA(id).basiscomp(i,1);
      c1 = gctgetcomm(id,i1);
		i2 = LAFREEDATA(id).basiscomp(i,2);
      c2 = gctgetcomm(id,i2);
      COMMTABLE = cat(1,COMMTABLE,[c1,c2,0,w]);
      LONGLIST(i) = -size(COMMTABLE,1); %computed but not stored
	end;
end;

ct = COMMTABLE;
%clear global LONGLIST;  
%clear global COMMTABLE; 
%clear global GCTNSTO;  
return;

function [r] = gctgetcomm(id,i) 
% find where to fetch the element

global LAFREEDATA;
global LONGLIST;  % all commutators in the FLA
global COMMTABLE; % the commutators that must be computed
global GCTNSTO;  % the number of computed elements

lli = LONGLIST(i);
if lli > 0, % already computed and stored
	r = lli;
   return;
end;

if lli < 0, % already computed but not stored
	GCTNSTO = GCTNSTO+1;
	COMMTABLE(-lli,3) = GCTNSTO;
	r = GCTNSTO;
	LONGLIST(i) = r;
	return;
end;

% not previously computed, compute and store
i1 = LAFREEDATA(id).basiscomp(i,1);
if i1==0, % fetch from input-list, no commutation
	c1 = 0;
	c2 = -i;
else,
   i2 = LAFREEDATA(id).basiscomp(i,2);
   c1 = gctgetcomm(id,i1);
   c2 = gctgetcomm(id,i2);
end;
GCTNSTO = GCTNSTO+1;
COMMTABLE = cat(1,COMMTABLE,[c1,c2,GCTNSTO,0]); %computed and stored
r = GCTNSTO;
LONGLIST(i) = r;
return;
