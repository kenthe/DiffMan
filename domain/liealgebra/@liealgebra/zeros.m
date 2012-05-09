function [oarray] = zeros(obj,sz)
% ZEROS - Creating an array of objects initalized to zero(obj).
% function [oarray] = zeros(obj,sz)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if length(sz) == 1,
  zobj = zero(obj);
  oarray(sz) = zobj;
  for i = 1:sz-1,
    oarray(i) = zobj;
  end;
else, 
  error('Input size vector not of correct length!');
end;
return;


