function [w] = plus(u,v)
% PLUS - Vector addition in LASE.
% function [w] = plus(u,v)

% WRITTEN BY : Kenth Engø, 1998.01.27
% MODIFIED BY: Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if u.shape ~= v.shape,
    error('Arguments are not of same shape!');
  end;
end;

w = u;
w.data{1} = u.data{1} + v.data{1};
w.data{2} = u.data{2} + v.data{2};
return;
