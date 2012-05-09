function [m] = dcayinv(a,b,ord)
% DCAYINV - The inverse of the differential of the Cayley transform.
% function m = dcayinv(a,b,ord)

% WRITTEN BY       : Kenth Engø, 2000 April
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK
  if ~isa(b,'ladirprod'),
    error('Second argument is not ''ladirprod''');
  end;
end;

m = a;

n = a.n;
sh = a.shape{2};
mat = cell(n,1);
m.data = mat;

for i = 1:n,
  if strcmp(sh{i,1},'ladirprod'),
    alg = ladirprod;
    setshape(alg,sh(i,:));
  elseif strcmp(sh{i,1},'latangent'),
    alg = ladirprod;
    setshape(alg,sh{i,2});
  elseif strcmp(sh{i,1},'lasemprod'),
    error('Do not know how to treat the case lasemprod yet!');
  else
    alg = eval( [sh{i,1} '(' int2str(sh{i,2}) ')'] );
  end;
  alg1 = alg;
  alg2 = alg;
  setdata(alg1,a.data{i});
  setdata(alg2,a.data{i});
  mat{i} = getdata(dcayinv(alg1,alg2,ord));
end;
setdata(m,mat);
return;

