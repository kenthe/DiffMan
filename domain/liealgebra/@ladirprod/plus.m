function [w] = plus(u,v)
% PLUS - Vector addition in LADIRPROD.
% function [w] = plus(u,v)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK,
  if ~sameshape(u,v),
    error('Input objects do not have the same shape.');
  end;
end;

w = ladirprod(u);
if iscellempty(u.data)|iscellempty(v.data), return; end; % Generic object.

sh = u.shape;
for i = 1:u.n,
  w.data{i} = ladpplus(u.data{i},v.data{i},sh{2}(i,:));
end;
return;
