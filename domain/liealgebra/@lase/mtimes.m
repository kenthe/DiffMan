function [w] = mtimes(u,v)
% MTIMES - Scalar multiplication in LASE.
% unction [w] = mtimes(u,v)

% WRITTEN BY : Kenth Engø, 1998.01.27
% MODIFIED BY: Kenth Engø, 1999.04.12

len = length(u);
if len == length(v),
  if isa(u,'lase'),  % right multiplication case.
    n = u(1).shape;
    w = lase(u(1));    
    w.data = {zeros(n*(n-1)/2,1) zeros(n,1)};
    for i = 1:len
      w.data{1} = w.data{1} + u(i).data{1}*v(i);
      w.data{2} = w.data{2} + u(i).data{2}*v(i);
    end;
  else,                    % left multiplication case.
    n = v(1).shape;
    w = lase(v(1));    
    w.data = {zeros(n*(n-1)/2,1) zeros(n,1)};
    for i = 1:len
      w.data{1} = w.data{1} + v(i).data{1}*u(i);
      w.data{2} = w.data{2} + v(i).data{2}*u(i);
    end;
  end;
else,
  error('Incorrect length of input vectors!');
end;
return;
