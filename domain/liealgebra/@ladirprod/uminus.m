function [w] = uminus(u)
% UMINUS - Uniary minus in the Lie algebra LADIRPROD.
% function [w] = uminus(u)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

w = ladirprod(u);
if iscellempty(u.data), return; end; % Generic object.

sh = u.shape;
for i = 1:u.n,
  w.data{i} = ladpuminus(u.data{i},sh{2}(i,:));
end;
return;
