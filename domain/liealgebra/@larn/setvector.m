function [] = setvector(a,dat)
% SETVECTOR - Sets vector representation of LARN.
% function [] = setvector(a,dat)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable.');
  end;
  if ~(isdata(a,dat)),
    error('Data is not of correct type!');
  end;
end;

len = length(a);
dat = reshape(dat,a(1).shape,len);
for i = 1:len,
  a(i).data = dat(:,i);
end;
assignin('caller',name,a);
return;
