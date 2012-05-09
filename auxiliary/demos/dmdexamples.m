function [] = dmdexamples
% DMDEXAMPLES - Setting up the DiffMan examples for the DiffMan DEMO.

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : None

labelList = str2mat( ...
    'DiffMan example #  1',...
    'DiffMan example #  2',...
    'DiffMan example #  3',...
    'DiffMan example #  4',...
    'DiffMan example #  5',...
    'DiffMan example #  6',...
    'DiffMan example #  7',...
    'DiffMan example #  8',...
    'DiffMan example #  9',...
    'DiffMan example # 10');

nameList = [...
      ' dmex1'
      ' dmex2'
      ' dmex3'
      ' dmex4'
      ' dmex5'
      ' dmex6'
      ' dmex7'
      ' dmex8'
      ' dmex9'
      'dmex10'];
  
figureFlagList = [1; 1; 0; 1; 1; 0; 1; 1; 1; 1];

cmdlnwin(labelList,nameList,figureFlagList);

set(0,'ShowHiddenHandles','on')
set(gcf,'Name','DiffMan Command Line Examples');
c = get(gcf,'Children');
for i = 1:length(c),
  h = c(i);
  if strcmp(get(h,'Type'),'uicontrol'),
    str = get(h,'String');
    if ~isempty(str),
      if strcmp(str,'Info'),
        set(h,'CallBack','dmhelp examples')
      end;
      if strcmp(str,'Comment Window'),
        set(h,'String','Welcome to the DiffMan Command Line Examples');
      end;
      if strncmp(str(1,:),' The buttons',10)
        str = [
        '                                                               '
        '  Launch different examples by pushing any of the above buttons'
        '                                                               '
        '  Remember to have your MATLAB Command Windom visible.         '
        ];
        set(h,'String',str);
      end;
    end;
  end;
end;
set(0,'ShowHiddenHandles','off')
