%-*-text-*-
function [w] = mtimes(u,v)
% MTIMES - Scalar multiplication in LATANGENT.
% function [w] = mtimes(u,v)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if (length(u) ~= length(v)),
    error('Input vectors do not have the same length.');
  end;
end;

n = length(u);
if n == 1,
  if isa(u,'latangent'),		% right multiplication
    w = latangent;
    w.shape = u.shape;
    w.data = scalmultcell(u.data,v);
  else			  		% left multiplication
    w = latangent;
    w.shape = v.shape;
    w.data = scalmultcell(v.data,u);
  end;
else,        % n > 1.
  if isa(u,'latangent'),		% right multiplication
    w = latangent;
    w.shape = u(1).shape;
    tmpcell = scalmultcell(u(1).data,v(1));
    for i = 2:n,
      tmpcell = addcells(tmpcell,scalmultcell(u(i).data,v(i)));
    end;
    w.data = tmpcell;
  else					% left multiplication
    w = latangent;
    w.shape = v(1).shape;
    tmpcell = scalmultcell(v(1).data,u(1));
    for i = 2:n,
      tmpcell = addcells(tmpcell,scalmultcell(v(i).data,u(i)));
    end;
    w.data = tmpcell;
  end;
end;
return;



