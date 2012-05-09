function z = adjoint(v,g)
% ADJOINT - The Adjoint map : Lalg x Lgr -> Lalg.
% function z = adjoint(v,g)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : Kenth Engø, 2000.09.11

global DMARGCHK

if DMARGCHK
  if ~(isa(g,'liegroup')&isa(v,'liealgebra')),
    error('Check arguments! 1. arg: Lie group, 2. arg: Lie algebra.');
  end;
end;

if isabelian(g),
  z = v;
  return;
elseif hasmatrix(g),
  gdat = getmatrix(g);
  vdat = getmatrix(v);
  z = liealgebra(v);
  if ~(isempty(gdat)|isempty(vdat))
    setdata(z,gdat*vdat*inv(gdat));
  end;
end;
return;
