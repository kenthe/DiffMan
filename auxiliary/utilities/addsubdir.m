function [] = addsubdir(newpath)
% ADDSUBDIR - Adds all subdirectories one level below directory specified by
%             newpath. 
%
% Does not add the directories: '.', '..', 'ARNEMA', 'OLD', and 'RCS'.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø, 1998.06.17 - Hans Munthe-Kaas, 1998.11.05

fs = filesep;
d = dir(newpath);
ni = length(d);
pths = {};
for i = 1:ni,
	pth = d(i).name;
  if d(i).isdir & ~strcmp(pth,'.') & ~strcmp(pth,'..') & ...
   	~strcmp(pth,'ARNEMA') & ~strcmp(pth,'OLD') & ...
	   ~strcmp(pth,'RCS'), 
	   if newpath(end)==fs,
	   	pths = [pths {[newpath pth]}];
	   else
	   	pths = [pths {[newpath fs pth]}];
	   end;
  end;
end;
addpath(pths{1:end});
return;
