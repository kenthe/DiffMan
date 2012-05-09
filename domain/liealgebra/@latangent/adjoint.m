function z = adjoint(g,v)
% ADJOINT - The Adjoint map : Lalg x Lgr -> Lalg.
% function z = adjoint(g,v)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK
  if ~(strcmp(class(g),'lgtangent')&strcmp(class(v),'latangent')),
    error('Check arguments! 1. arg: lgtangent, 2. arg: latangent.');
  end;
end;

z = v;
z.data = {{} {}};

sh = v.shape;
gdat = getdata(g);

if strcmp(sh{1},'ladirprod'),
  alg = ladirprod;
  setshape(alg,sh);
elseif strcmp(sh{1},'latangent'),
  alg = ladirprod;
  setshape(alg,sh);
elseif strcmp(sh{1},'lasemprod'),
  error('Do not know how to treat the case lasemprod yet!');
else
  alg = eval( [sh{1} '(' int2str(sh{2}) ')'] );
end;

x = alg; setdata(x,v.data{1});
y = alg; setdata(y,v.data{2});

grp = liegroup(alg);

a = grp; setdata(a,gdat{1});
u = alg; setdata(u,gdat{2});

z.data{1} = getdata(adjoint(a,x));
z.data{2} = getdata(adjoint(a,y-[x,u]));
return;

