function z = cay(lgr,a)
% CAY - Computes the Cayley coordinates from LADIRPROD -> LGDIRPROD.
% function z = cay(lgr,a)

% WRITTEN BY       : Kenth Engø, 2000 April
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK
  if ~strcmp(class(a),'ladirprod'),
    error('Second input argument is not of class: ladirprod');
  end;
end;

z = lgr;
z.data = cell(1,z.n);
if iscellempty(getdata(a)), return; end;

sh = getshape(a);
dat = getdata(a);
for i = 1:z.n
  z.data{i} = lgdpcay(dat{i},sh{2}(i,:));
end;
return;
