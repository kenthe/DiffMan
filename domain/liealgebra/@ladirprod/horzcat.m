function [w] = horzcat(a,b)
% HORZCAT - Commutator LADIRPROD (componentwise commutator).
% function [w] = horzcat(a,b)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK,
  if ~sameshape(a,b),
    error('Input objects do not have the same shape.');
  end;
end;

w = ladirprod(a);   % Copy shape info from 'a' - no data info.
if iscellempty(a.data)|iscellempty(b.data), return; end; % Generic object.

sh = a.shape;
for i = 1:a.n,
  w.data{i} = ladphorzcat(a.data{i},b.data{i},sh{2}(i,:));
end;
return;
