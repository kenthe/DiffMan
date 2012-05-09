function [w] = getvector(g)
% GETVECTOR - Returns a vector representation in LASU.
% function [w] = getvector(g)

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

len = length(g);
if len == 1,
  if isempty(g.data), w = []; return; end;
  w = m2v(g.data,g.shape);
else
  mat = getmatrix(g);
  w = zeros(ceil(dimension(g)),len);
  for i = 1:len,
    dat = mat(:,:,i);
    w(:,i) = m2v(dat,g(1).shape);
  end;
  w = w(:);
end;
return;

function [v] = m2v(m,n)
% Assumes that input matrix m is nxn.
sz = ceil(n*n/2-1/2);
v = zeros(sz,1); k = 1;
for i = n-1:-1:1,
  for j = n:-1:i+1,
    v(k) = m(i,j); k = k+1;
  end;
end;
d = imag(diag(m));
if rem(n,2) == 0,
  v(n*(n-1)/2+1:end) = d(1:n/2) + sqrt(-1)*[d(n/2+1:end-1); 0];
else,
  v(n*(n-1)/2+1:end) = d(1:floor(n/2)) + sqrt(-1)*d(floor(n/2)+1:end-1);
end;
return;
