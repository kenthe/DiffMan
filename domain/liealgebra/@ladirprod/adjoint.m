function z = adjoint(v,g)
% ADJOINT - The Adjoint map : Lalg x Lgr -> Lalg.
% function z = adjoint(g,v)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK
  if ~(strcmp(class(g),'lgdirprod')&strcmp(class(v),'ladirprod')),
    error('Check arguments! 1. arg: lgdirprod, 2. arg: ladirprod.');
  end;
end;

z = v;
z.data = cell(v.n,2);

sh = v.shape{2};
gdat = getdata(g);

for i = 1:v.n,
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
  setdata(alg,v.data{i});
  grp = liegroup(alg);
  setdata(grp,gdat{i});
  z.data{i} = getdata(adjoint(alg,grp));
end;
return;

