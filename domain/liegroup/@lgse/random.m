function z = random(a)
% RANDOM - Creates a random object in LGSE.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

sh = a.shape;
z = lgse(sh);
z.data{1} = getdata(random(lgso(sh)));
z.data{2} = getdata(random(lgrn(sh)));
return;
