function [] = setdomain(vf,dom)
% SETDOMAIN - Sets dom to be the domain of the vector field vf.
% function [] = setdomain(vf,dom)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end
  if ~isa(dom,'hmanifold'),
    error('Input is not a manifold object');
  end;
end;

vf.domain = dom;

assignin('caller',name,vf)
return;

