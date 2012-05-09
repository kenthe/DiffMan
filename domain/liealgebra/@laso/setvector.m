function [] = setvector(a,v)
% SETVECTOR - Sets the vector representation in LASO.
% function [] = setvector(a,v)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

global DMARGCHK

n = a(1).shape;
len = length(a);
vlen = n*(n-1)/2;
name = inputname(1);

if DMARGCHK
  if isempty(name),
    error('First argument must be a named variable.');
  end;
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if length(v) ~= (len*vlen), 
    error('Input vector does not have correct length!'); 
  end;
end;

mat = zeros(n,n,len);
for i = 1:len,
  mat(:,:,i) = v2m(v((i-1)*vlen+1:i*vlen),n);
end;

if ismatrix(a,mat),
  setmatrix(a,mat);
else
  error('Input vector is not a valid data-representation!');
end;

assignin('caller',name,a)
return;

function m = v2m(v,n)
% Assumes that input vector v is of length n*(n-1)/2.
mat = zeros(n); k = 1;
for i = n-1:-1:1,
  for j = n:-1:i+1,
    mat(i,j) = (-1)^(i+j)*v(k);
    k = k+1;
  end;
end;
m = mat - mat';
return;
