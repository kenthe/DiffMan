function [] = setvector(a,v)
% SETVECTOR - Sets vector representaion of LASP.
% function [] = setvector(a,v)     

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

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

for i = 1:length(a),
  a(i).data = v(:,:,i);
end;
assignin('caller',name,a);
return;
