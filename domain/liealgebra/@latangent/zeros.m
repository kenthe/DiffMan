%-*-text-*-
function [oarray] = zeros(obj,sz)
% ZEROS - Overloaded version of 'zeros'.
% function [oarray] = zeros(obj,sz)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

global DMARGCHK

if DMARGCHK,
  if ~dmisinteger(sz) & sz > 0,
    error('Second input argument is not an integer greater than zero.');
  end;
end;

zobj = zero(obj);
oarray(sz,1) = zobj;
for i = 1:sz-1,
  oarray(i) = zobj;
end;
return;


