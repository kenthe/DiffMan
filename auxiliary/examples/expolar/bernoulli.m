function Bn = bernoulli(n);

%
% BERNOULLI(n)    returns the n-th Bernoulli number in the expansion of
%    the function (exp(z)-1)/z at z=0.
%

%  Written by: A. Zanna, March 2000
%  Last modified by: A. Zanna, 5.5.2000

if n>24 
  disp('! Error: available only for n<24')
  return
end

B = [1, -1/2, 1/6, 0, -1/30,0, 1/42, 0, -1/30, 0, 5/66,0,-691/2730,0,7/6,0 ...
    -3617/510, 0, 43867/798, 0, -174611/330, 0, 854513/138, 0, -236364091/2730];

Bn = B(n+1);
return;

