function [] = setvector(a,v)
% SETVECTOR - Sets vector representation of LAGL.
% function [] = setvector(a,v)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Aug.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

n = a(1).shape; 
name = inputname(1);
v = reshape(v,n,n,length(a));	

if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if isempty(n), 
    error('Update variable has no shape!'); 
  end;
  if ~ismatrix(a,v),
    error('Input vector is not a valid data-representation!');
  end;
end;

setmatrix(a,v);
assignin('caller',name,a);
return;
