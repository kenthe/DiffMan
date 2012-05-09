function [] = setvector(a,v)
% SETVECTOR - Sets data in LASL equal to the vector data 'v'.
% function [] = setvector(a,v)

% WRITTEN BY       : Kenth Engø, 1997.11.07
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

n = a(1).shape;
len = length(a);
name = inputname(1);
v(end+1:end+len) = zeros(len,1);
v = reshape(v,n,n,len);

for i = 1:len,
  dig = sum(diag(v(:,:,i)));
  v(n,n,i) = -dig;
end;

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
