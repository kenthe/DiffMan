function [id] = lafreeinit(shape)
% LAFREEINIT - Diffman: LIEALGEBRA class LAFREE private function
%              Compute various info about a free liealgebra, Hall basis,
%              commutator rules etc. 

% Is info already computed?
% LAFREEDATA(id):
%   .basiscomp: components are i and j in: [i,j]
%   .basorder : order of all basiselements, see lafree.doc
%   .basdegree : list of degree of basis elements, e.g. degree([1,[1,2]])==3
%   .commres  : results of commutator computations
%   .commtab  : commutator table
%   .dim      : dimension of algebra
%   .shape    : all info about the shape

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Hans Munthe-Kaas, 1998.11.06

if (nargin ~= 1)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
if isa(LAFREEDATA,'double'), % this is first time it is created
  id = 1;
else,
  for i = 1:length(LAFREEDATA),
    shi = LAFREEDATA(i).shape;
    if eqshape(shi,shape),
      id = i;
      return;
    end;
  end;
  id = length(LAFREEDATA)+1;
end;

% compute and store various info about free liealgebra defined by a.
sh = shape{1};
s1 = sh(1);
s2 = sh(2);

% compute Hall basis
maxsize = 10000; % max size of algebra
ords = ones(1,maxsize); % NB: names of order and degree are swapped
degs = zeros(1,maxsize);%     in the implementation.
bdeg = shape{2};
degs(1:length(bdeg)) = bdeg;
bcomp = zeros(maxsize,2);
ctb = sparse(maxsize,maxsize);
ipos = s1;
ostart = 1;
if(dmprogrep), 
   repprogress('Computing Hall basis for FLA (time estimate may be wrong):');
end;
for iord=2:s2,
   if(dmprogrep), 
      repprogress(iord,2,s2);
   end;
  ostart(iord) = ipos+1;
  for io1 = 1:floor(iord/2),
    for io2 = iord-io1;
      for i = ostart(io1):ostart(io1+1)-1,
	for j = max(i+1,ostart(io2)):ostart(io2+1)-1,
	  dgr = degs(i)+degs(j);
	  if dgr<=s2,
	    if ords(i)+ords(j)==iord,
	      % check if comm is in Hall basis
	      inhall = 1;
	      if ords(j)>1,
		if bcomp(j,1)>i,
		  inhall = 0;
		end;
	      end;
	      if inhall,
		ipos = ipos+1;
		if (ipos>maxsize),
		  error(['Dimension of free algebra is greater than ' int2str(maxsize) '. Read info in "lafree.doc".']);
		end;
		ords(ipos) = iord;
		degs(ipos) = dgr;
		bcomp(ipos,1) = i;
		bcomp(ipos,2) = j;
		ctb(i,j) = ipos;
	      end;
	    end;
	  end;
	end;
      end;
    end;
  end;
end;
LAFREEDATA(id).basiscomp = bcomp(1:ipos,:);
LAFREEDATA(id).basorder = degs(1:ipos);
LAFREEDATA(id).basdegree = ords(1:ipos);
LAFREEDATA(id).commres = sparse(ipos,0);
LAFREEDATA(id).commtab = ctb(1:ipos,1:ipos);
LAFREEDATA(id).dim = ipos;
LAFREEDATA(id).shape = shape;
return;

