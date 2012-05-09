function [p] = firstpartition(k,l);
%  FIRSTPARTITION  determining the first partition of N elements summing to K
%    FIRSTPARTITION(K,N) returns an N-dimensional vector with all ones in the 
%    the first N-1 components and K-N+1 in the last component so that all the 
%    all the components sum to K.
%
%    This file is an useful routine in XPOLAR, YPOLAR, NBCH. 
%   
%    See also NEXTPARTITION

% Written by: H. Munthe-Kaas, March 2000
% Last modified by: A. Zanna 5.5.2000
p = ones(1,l);
p(end) = k-sum(p)+1;
