function [c] = horzcat(a,b)
% HORZCAT - Commutator in the Lie algebra LASE.
% function [c] = horzcat(a,b)

% WRITTEN BY       : Kenth Engø, 1998.01.27
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if a.shape ~= b.shape
    error('Arguments are not of same shape!');
  end;
end;

c = a;
c.data{1} = cross(a.data{1},b.data{1});
c.data{2} = cross(a.data{1},b.data{2}) - cross(b.data{1},a.data{2});
return;
