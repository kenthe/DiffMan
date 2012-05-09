function [w] = getvector(g)
% GETVECTOR - Returns the vector representation in LASO_PQ.
% function [w] = getvector(g)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

len = length(g);
if len == 1,
  if isempty(g.data), w = []; return; end;
  w = m2v(g(1).data,sum(g(1).shape),g(1).shape(1));;
else
  sh = sum(g(1).shape);
  mat = getmatrix(g);
  w = zeros(dimension(g),len);
  for i = 1:len,
    dat = mat(:,:,i);
    w(:,i) = m2v(dat,sh,g(1).shape(1));
  end;
  w = w(:);
end;
return;

function [v] = m2v(m,n,p)
% Assumes that input matrix m is nxn.
v = zeros(n*(n-1)/2,1);
k = 1;
for i = n-1:-1:1,
  for j = n:-1:i+1,
    if ((i<=p)&(j<=p))|((i>p)&(j>p))
      const = (-1)^(i+j);
    else,
      const = 1;
    end;
    v(k) = const*m(i,j);
    k = k+1;
  end;
end;
return;
