function [dat] = getdata(u)
% GETDATA - Returns the data representation of LGSE.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

dat = {[] []};
if isempty(u.data), return; end;
dat{1} = u.data{1};
dat{2} = u.data{2};
return;
