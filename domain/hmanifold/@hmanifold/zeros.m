function [oarray] = zeros(obj,sz)
% ZEROS - Creates an array of objects initalized to the origin object.
% function [oarray] = zeros(obj,sz)

% WRITTEN BY       : Kenth Engø, 1997.10.28
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if length(sz) == 1,
  shobj = getshape(obj);
  oarray(sz) = obj;			% Reshape of array to correct length.
  for i = 1:sz-1,
    oarray(i) = obj;
  end;
  dat = getdata(origin(obj));
  setdata(obj,dat);
  for i = 1:sz,
    oarray(i) = obj;
  end;
else, 
  error('Input size not correct!');
end;
return;


