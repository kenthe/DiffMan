function d = magnusdim(m)
d = 0;
for i = 1:2:2*m,
	nu = lafcount(i,[1:m]);
	d = d + nu;
end;
