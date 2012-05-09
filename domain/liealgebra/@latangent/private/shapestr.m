%-*-text-*-
function [str] = shapestr(sh)
% SHAPESTR - Returns the shape info in cell-array 'sh' as a str.
% function [str] = shapestr(sh)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 2000.03.27

for i = 1:size(sh{2},1),
  if strcmp(sh{1},'ladirprod'),
    if strcmp(sh{2}{i,1},'ladirprod')
      tmpstr = ['(' shapestr(sh{2}(i,:)) ')'];
    else,
      tmpstr = shapestr(sh{2}(i,:));
    end;
  elseif strcmp(sh{1},'latangent'),
    tmpstr = ['T(' shapestr(sh{2}) ')'];
  elseif strcmp(sh{1},'lasemprod'),
    error('Does not handle ''lasemprod''-objects yet.');
  else,  % matrix Lie group elements
    if ~isempty(sh{2}),
      str = [sh{1} '(' int2str(sh{2}) ')'];
    else,
      str = sh{1};
    end;
    return;
  end;
  if (i == 1), str = tmpstr; else,
    str = [str ' x ' tmpstr];
  end;
end;
return;

