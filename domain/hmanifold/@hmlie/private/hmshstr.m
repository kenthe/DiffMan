%-*-text-*-
function [str] = hmshstr(sh)
% HMSHSTR - Returns the shape info in cell-array 'sh' as a string.
% function [str] = hmshstr(sh)

% WRITTEN BY       : Kenth EngÅ¯, 2000 Mar.
% LAST MODIFIED BY : None

for i = 1:size(sh{2},1),
  if strcmp(sh{1},'lgdirprod'),
    if strcmp(sh{2}{i,1},'lgdirprod')
      tmpstr = ['(' hmshstr(sh{2}(i,:)) ')'];
    else,
      tmpstr = hmshstr(sh{2}(i,:));
    end;
  elseif strcmp(sh{1},'lgtangent'),
    tmpstr = ['T(' hmshstr(sh{2}) ')'];
  elseif strcmp(sh{1},'lgsemprod'),
    error('Does not handle ''lgsemprod''-objects yet.');
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

