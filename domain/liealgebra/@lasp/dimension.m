function [d] = dimension(a)
% DIMENSION - Returns the dimension of the vectorspace LASP.
% function [d] = dimension(a)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.06

global DMARGCHK

if DMARGCHK,
  if isempty(a(1).shape), 
    error('Element has no assigned shape.'); 
  end;
end;

d = a(1).shape*(a(1).shape + 1)/2;
return;

