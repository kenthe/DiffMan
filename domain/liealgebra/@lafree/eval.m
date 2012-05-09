function [r] = eval(f,varargin)
% EVAL - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 2000.09.15

lalst = cat(1,varargin{1:end});

commtab = f.commtab;
if isempty(commtab), 
	display 'computing commtab!';
	commtab = getcommtab(f); 
end;
s = length(lalst);
nc = size(commtab,1);

% matrix case and non-matrix cases are treated separately

if hasmatrix(lalst),
	scrlng = max(commtab(:,3));
	r = lalst(1);
	matdim = size(getmatrix(r));
	scratch = zeros([matdim scrlng]); % space to store intermediate comm.
	mr = zeros(matdim);
	for i  = 1:size(commtab,1),
		i1  = commtab(i,1);
		i2  = commtab(i,2);
		sto = commtab(i,3);
		w   = commtab(i,4);
		if i1==0,
			mc = getmatrix(lalst(-i2));
		else,
			if i1 < 0,
				c1 = getmatrix(lalst(-i1));
			else;
				c1 = scratch(:,:,i1);
			end;
			if i2 < 0,
				c2 = getmatrix(lalst(-i2));
			else;
				c2 = scratch(:,:,i2);
			end;
			mc = c1*c2 - c2*c1;
		end;			
		if sto,
			scratch(:,:,sto) = mc;
		end;
		mr = mr + w*mc;
	end;
	setmatrix(r,mr);
else;
	scrlng = max(commtab(:,3));
	r = zero(lalst(1));
	scratch = array([scrlng 1],r); % space to store intermediate comm.
	for i  = 1:size(commtab,1),
		i1  = commtab(i,1);
		i2  = commtab(i,2);
		sto = commtab(i,3);
		w   = commtab(i,4);
		if i1==0,
			c = lalst(-i2);
		else,
			if i1 < 0,
				c1 = lalst(-i1);
			else;
				c1 = scratch(i1);
			end;
			if i2 < 0,
				c2 = lalst(-i2);
			else;
				c2 = scratch(i2);
			end;
			c = [c1,c2];
		end;			
		if sto,
			scratch(sto) = c;
		end;
		r = r + w*c;
	end;
end;

return;
