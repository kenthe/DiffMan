function [dim] = dimension(a)
% DIMENSION - Returns the dimensions of the vectorspaces.
% function [dim] = dimension(a)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

if isempty(a.shape),
  disp('      This is an generic ladirprod-object, hence it contains');
  disp('      no dimension information.');
  return;
end;

dim = 0;
sh = a.shape;
for i = 1:a.n,
  if strcmp(sh{2}{i,1},'ladirprod')|strcmp(sh{2}{i,1},'lasemprod')|strcmp(sh{2}{i,1},'latangent')
    dimtmp = ladpdimension(sh{2}(i,:));
  else,
    dimtmp = dimension(eval([sh{2}{i,1} '(' int2str(sh{2}{i,2}) ')']));
  end;
  dim = dim + dimtmp;
end;
return;


