function [w] = mtimes(u,v)
% MTIMES - Scalar multiplication in LADIRPROD.
% function [w] = mtimes(u,v)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK,
  if (length(u) ~= length(v)),
    error('Input vectors do not have the same length.');
  end;
end;

n = length(u);
if n == 1,
  if isa(u,'ladirprod'),		% right multiplication
    w = ladirprod(u);
    w.data = scalmultcell(u.data,v);
  else			  		% left multiplication
    w = ladirprod(v);
    w.data = scalmultcell(v.data,u);
  end;
else,        % n > 1.
  if isa(u,'ladirprod'),		% right multiplication
    w = ladirprod(u(1));
    tmpcell = scalmultcell(u(1).data,v(1));
    for i = 2:n,
      tmpcell = addcells(tmpcell,scalmultcell(u(i).data,v(i)));
    end;
    w.data = tmpcell;
  else					% left multiplication
    w = ladirprod(v(1))
    tmpcell = scalmultcell(v(1).data,u(1));
    for i = 2:n,
      tmpcell = addcells(tmpcell,scalmultcell(v(i).data,u(i)));
    end;
    w.data = tmpcell;
  end;
end;
return;



