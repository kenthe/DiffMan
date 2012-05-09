function [w] = mtimes(u,v)
% MTIMES - Scalar multiplication in LASU.
% function [w] = mtimes(u,v)

% WRITTEN BY       : Kenth Engø, 1999 April.
% LAST MODIFIED BY : Kenth Engø, 1999.04.09

len = length(u);
if len == length(v),
  if isa(u,'lasu'),        % right multiplication case.
    dim = ceil(dimension(u(1)));
    vec = getvector(u);
    vec = reshape(vec,dim,len);
    if all(size(v) == [len,1]), else, v=v'; end; % Assure v is a vector.
    v = v(:,ones(dim,1));		% Applying Tony's trick.
    if len == 1,
      vec = vec'.*v;
    else
      vec = sum(vec'.*v);
    end;
    w = liealgebra(u(1));
    setvector(w,vec');
  else,                    % left multiplication case.
    dim = ceil(dimension(v(1)));
    vec = getvector(v);
    vec = reshape(vec,dim,len);
    if all(size(u) == [len,1]), else, u=u'; end; % Assure u is a vector.
    u = u(:,ones(dim,1));		% Applying Tony's trick.
    if len == 1,
      vec = vec'.*u;
    else
      vec = sum(vec'.*u);
    end;
    w = liealgebra(v(1));
    setvector(w,vec');
  end;
else,
  error('Wrong length of input vectors!');
end;
return;
