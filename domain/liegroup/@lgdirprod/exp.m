function z = exp(lgr,a)
% EXP - Computes the exponetial from LADIRPROD -> LGDIRPROD.
% function z = exp(lgr,a)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 2000.03.29

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
  z.data{i} = lgdpexp(dat{i},sh{2}(i,:));
end;
return;
