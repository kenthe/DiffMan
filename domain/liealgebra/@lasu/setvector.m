function [] = setvector(a,v)
% SETVECTOR - Sets vector representation in LASU equal the vector 'v'.
% function [] = setvector(a,v)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

n = a(1).shape;
len = length(a);
vlen = ceil(dimension(a(1)));
name = inputname(1);
mat = zeros(n,n,len);
for i = 1:len,
  mat(:,:,i) = v2m(v((i-1)*vlen+1:i*vlen),n);
end;

if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable.');
  end;
  if isempty(n),
    error('Update variable has no shape.');
  end;
  if length(v) ~= (len*vlen), 
    error('Input vector does not have correct length!'); 
  end;
  if ~ismatrix(a,mat),
    error('Input vector is not a valid data-representation!');
  end;
end;

setmatrix(a,mat);
assignin('caller',name,a)
return;

function m = v2m(v,n)
% Assumes that matrix is of size nxn.
m = zeros(n); k = 1;
for i = n-1:-1:1,
  for j = n:-1:i+1,
    m(i,j) = v(k); k = k+1;
  end;
end;
m = m - m';
d = v(n*(n-1)/2+1:end);
vec = sqrt(-1)*[real(d); imag(d)];
if rem(n,2) == 1,
  vec = [vec; -sum(vec)];
else,
  vec(end) = -sum(vec);
end;
m = m - diag(diag(m)) + diag(vec);
return;
