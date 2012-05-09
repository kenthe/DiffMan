function [c] = mtimes(a,b)
% MTIMES - The binary operation for the Lie group LGSE.
% function [c] = mtimes(a,b)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

if DMARGCHK
  if a.shape ~= b.shape,
    error('Arguments do not have the same shape!');
  end;
end;

c = lgse(a.shape);
c.data{1} = a.data{1}*b.data{1}; 
c.data{2} = a.data{2} + a.data{1}*b.data{2}; 
return;
