function [out] = dmoptimize(arg)
% DMOPTIMIZE - Turn on/off the use of optimized, shape dependent code.
% function [out] = dmoptimize(arg)
%
% REMARK: For some domains, e.g. laso(3), there exists better algorithms
%         for the computation of the exponential, logarithm, commutator, etc.
%         These algorithms usually depend on the shape of the input matrix.

% WRITTEN BY       : Kenth Engø, 1999.04.08
% LAST MODIFIED BY : None

global DMOPTIMIZE;

if (nargin == 0) | (nargout == 1),
  out = DMOPTIMIZE;
  return;
end;
arg = lower(arg);
if strcmp(arg,'on'),
  DMOPTIMIZE = 1;
else,
  DMOPTIMIZE = 0;  
end;
out = DMOPTIMIZE;
return;
