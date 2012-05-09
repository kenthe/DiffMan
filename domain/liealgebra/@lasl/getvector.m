function [v] = getvector(g)
% GETVECTOR - Returns a vector representation of LASL.
% function [v] = getvector(g)

% WRITTEN BY       : Kenth Engø, 1997.11.07
% LAST MODIFIED BY : Kenth Engø, 1999.04.06

len = length(g);
mat = getmatrix(g);
dim = g(1).shape^2-1; 
v = zeros(len*dim,1);
for i=1:len,
  tmp = mat(:,:,i);
  tmp = tmp(:);
  tmp = tmp(1:end-1);
  v((i-1)*dim+1:i*dim) = tmp;
end;
return;
