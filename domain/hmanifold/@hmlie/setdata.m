function [] = setdata(a,m)
% SETDATA - Sets the data representation in HMLIE.
% function [] = setdata(a,m)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable');
  end;
end;

sh = a(1).shape;
len = length(a);
if hasmatrix(sh),                       % A matrix representation exists.
  if isdata(sh,m);
    for i = 1:len, a(i).data = m(:,:,i); end;
  else,
    error('Supplied data is not a valid representation.');
  end;
else					% No matrix repr. => assume vec. repr.
  if isdata(sh,m);
    for i = 1:len, a(i).data = m(:,i); end;
  else,
    error('Supplied data is not a valid representation.');
  end;
end;

assignin('caller',name,a);  
return;
