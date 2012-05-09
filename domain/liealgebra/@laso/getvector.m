function [w] = getvector(g)
% GETVECTOR - Returns the vector representation in LASO.
% function [w] = getvector(g)

% WRITTEN BY       : Kenth Engø, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

len = length(g);
if len == 1,
  if isempty(g.data), w = []; return; end;
  w = m2v(g.data,g.shape);
else
  sh = g(1).shape;
  mat = getmatrix(g);
  w = zeros(dimension(g),len);
  for i = 1:len,
    dat = mat(:,:,i);
    w(:,i) = m2v(dat,sh);
  end;
  w = w(:);
end;
return;

function [v] = m2v(m,n)
% Assumes that input matrix m is nxn.
v = zeros(n*(n-1)/2,1);
k = 1;
for i = n-1:-1:1,
  for j = n:-1:i+1,
    v(k) = (-1)^(i+j)*m(i,j);
    k = k+1;
  end;
end;
return;
