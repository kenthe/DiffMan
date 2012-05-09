function [a] = iseven(n)
% ISEVEN Checks if an integer is even
%
% function [a] = iseven(n)

% hmk nov - 96

if (2*round(n/2) == n), 
   a = 1; 
else,
   a=0; 
end;
