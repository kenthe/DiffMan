function [] = dmtutorial
% DMTUTORIAL - Launches a window with DiffMan tutorials.
%
% You can find tutorials about the following subjects: 
%      dmtutorial - How to solve ODEs in DiffMan.
%      dmtdomains - DiffMan Domains 

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : None

labelList = str2mat(...
    'How to solve ODEs in DiffMan',...
    'DiffMan Domains');

nameList = [...
      'dmthow2solve'
      'dmtdomains  '];
  
figureFlagList = zeros(length(nameList),1);

cmdlnwin(labelList,nameList,figureFlagList);

set(0,'ShowHiddenHandles','on')
set(gcf,'Name','DiffMan Tutorials');
c = get(gcf,'Children');
for i = 1:length(c),
  h = c(i);
  if strcmp(get(h,'Type'),'uicontrol'),
    str = get(h,'String');
    if ~isempty(str),
      if strcmp(str,'Info'),
        set(h,'CallBack','dmhelp dmtutorial')
      end;
      if strcmp(str,'Comment Window'),
        set(h,'String','Welcome to the DiffMan Tutorials');
      end;
      if strncmp(str(1,:),' The buttons',10)
        str = [
        '                                                                '
        '  Launch different tutorials by pushing any of the above buttons'
        ];
        set(h,'String',str);
      end;
    end;
  end;
end;
set(0,'ShowHiddenHandles','off')
