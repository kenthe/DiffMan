function z = random(a)
% RANDOM - Creates a random object in the Lie group.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1997.10.08
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

sh = getshape(a);
nfield = getnumberfield(a);
if isabelian(a),			% Abelian case.
  z = liegroup(a);
  if strcmp(nfield,'R'),
    zdata = 2*rand(sh,1) - ones(sh,1);
  else,
    zdata = 2*rand(sh,1) - ones(sh,1) + i*(2*rand(sh,1) - ones(sh,1));
  end;
  setdata(z,project(z,zdata));
  return;
end;
if hasmatrix(a),			% Matrix case.
  z = liegroup(a);
  if strcmp(nfield,'R'),
    zdata = 2*rand(sh) - ones(sh);
  else,
    zdata = 2*rand(sh) - ones(sh) + i*(2*rand(sh) - ones(sh));
  end;
  setmatrix(z,project(z,zdata));
  return;
end;
return;
