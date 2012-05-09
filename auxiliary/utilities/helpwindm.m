% HELPWINDM - modification of helpwin.m. SHOULD BE CALLED ONLY BY DMHELP!
%
%    Modifications of helpwin.m:
%
%    Text substitutions:
%       helpwin -> helpwindm
%       MATLAB Help Window -> DiffMan Help Window
%       MiniHelPFigurE -> MiniDMHelPFigurE
%    Other modifications: Search for %dmmod
%    
%

% Written by MatWorks.
% Last modified by: Hans Munthe-Kaas, 1998.11.20.

function helpwindm(topic,pagetitle,helptitle,varargin)
%HELPWIN On-line help, separate window for navigation.
%   HELPWIN TOPIC opens a help window and displays the help text for the
%   given TOPIC.  Links are created to functions referenced in the 'See Also'
%   line of the help text.
%
%   HELPWIN(HELP_STR,TITLE) displays the string HELP_STR in the help
%   window.  HELP_STR may be passed in as a string with each line separated
%   by carriage returns, a column vector cell array of strings with each cell
%   (row) representing a line or as a string matrix with each row representing
%   a line.  The optional string TITLE will appear in the title edit box.
%
%   HELPWIN({TITLE1 HELP_STR1;TITLE2 HELP_STR2;...},PAGE) displays one page
%   of multi-page help text.  The multi-page help text is passed in as a
%   cell array of strings or cells containing TITLE and HELP_STR pairs.
%   Each row of the multi-page help text cell array (dimensioned number of
%   pages by 2) consists of a title string paired with a string, cell array
%   or string matrix of help text.  The second argument PAGE is a string 
%   which must match one of the TITLE entries in the multi-page help text.
%   The matching TITLE represents the page that is to be displayed first.
%   If no second argument is given, the first page is displayed.
%
%   A third argument may be passed to HELPWIN which is a string that becomes
%   the title of the help window figure.
%
%   Additional arguments, after the window title, will be interpreted as
%   Handle Graphics parameter-value pairs to be applied to the text displayed
%   in the help window.
%
%   Examples.
%             helpwin plot
%             helpwin('Help String','title')
%             helpwin(['Help text for' sprintf('\n') 'my m-file.'],'title')
%             helpwin({'Help String for';'my m-file'},'title')
%             helpwin(str,'Topic 2','My Title')
%               where,
%               str =  { 'Topic 1' 'Help string for Topic 1';
%                        'Topic 2' 'Help string for Topic 2';
%                        'Topic 3' 'Help string for Topic 3' }
%
%   See also DOC, DOCOPT, HELP, WEB.

%   Copyright (c) 1984-98 by The MathWorks, Inc.
%   $Revision: 1.3 $

% If no arguments are given, load up the Home help page.
if nargin==0
   topic = 'HelpwinHome';
end

% Switchyard on 'topic'.  It is either a command or a help entry.
if iscell(topic), 
   cmd = char(topic(1,1));
else
   cmd = char(topic(1,:));
end

switch cmd

%-----------------------------------------------------------------------
case 'HelpwinPage'
   % This case is used to link a page to others pages in the text entry.
   TopicPop = gcbo;
   val = get(TopicPop,'value');
   if val~=1
      refstr = get(TopicPop,'string');
      ref = deblank(refstr{val});
      topic = get(TopicPop,'userdata');
      helpwindm(topic,ref);
   end

%-----------------------------------------------------------------------
case 'HelpwinSeealso'
   % This case is used to link a page to others referenced in the
   % See Also text.
   SeeAlsoPop = gcbo;
   val = get(SeeAlsoPop,'value');
   if val~=1
      set(SeeAlsoPop,'value',1);
      refstr = get(SeeAlsoPop,'string');
      ref = deblank(refstr{val});
      if length(ref) >= 5
         if strcmp(ref(1:5),'More ')
            ind = max(findstr(ref,' help'));
            if ~isempty(ind)
               doc(ref(6:ind-1));
            end
         else
            helpwindm(ref);
         end
      else
         helpwindm(ref);
      end
   end
   
%-----------------------------------------------------------------------
case 'HelpwinBack'
   % This case is used to go back one page in the stack.
   BackBtn = gcbo;
   fig = gcbf;
   fud = get(fig,'UserData');
   pgtitle = get(findobj(fig,'tag','CurHelpEdit'),'string');
   if pgtitle(1) == ' ', pgtitle(1) = []; end  % remove first char if space
   match = max(strmatch(pgtitle,{fud.pagetitle},'exact'));
   ref = fud(match+1);
   set(BackBtn,'UserData',1);  % set flag to indicate Back call
   helpwindm(ref.topic,ref.pagetitle,ref.helptitle);
   
%-----------------------------------------------------------------------
case 'HelpwinForward'
   % This case is used to go forward one page in the stack.
   fig = gcbf;
   BackBtn = findobj(fig,'Tag','BackBtn');
   fud = get(fig,'UserData');
   pgtitle = get(findobj(fig,'tag','CurHelpEdit'),'string');
   if pgtitle(1) == ' ', pgtitle(1) = []; end  % remove first char if space
   match = min(strmatch(pgtitle,{fud.pagetitle},'exact'));
   ref = fud(match-1);
   set(BackBtn,'UserData',1);  % set flag to indicate Back/Forw call to
   helpwindm(ref.topic,ref.pagetitle,ref.helptitle);
   
%-----------------------------------------------------------------------
case 'HelpwinHome'
   % This case is used to go to the Home help screen.
   str = help;
   helpwindm({str},'MATLAB Help Topics');
   
%-----------------------------------------------------------------------
case 'HelpwinOpen'
   % This case is used to open another link from a double-click in
   % the list box.

   % Determine whether this is a double click.
   fig = gcbf;
   if strcmp(get(fig,'SelectionType'),'open')
      ListBox = findobj(fig,'Tag','ListBox');
      SeeAlsoPop = findobj(fig,'tag','SeeAlsoPop');

      ln = get(ListBox,'value');
      helpstr = get(ListBox,'string');      

      % Find the function link index or the See Also index.
      hstr = helpstr';
      hstr = lower(hstr(:)');
      cols = size(helpstr,2);
      seealso = floor((findstr('see also',hstr)/cols) + 1);
      dash = floor((findstr(' - ',hstr)/cols) + 1);

      % If there is a 'See Also', follow the 'See also' index
      if ~isempty(seealso)
         if ln == seealso
            % Determine which item in the list is a the first in the 
            % 'See also' text list.
            poplist = get(SeeAlsoPop,'string');
            if length(poplist{2}) >= 5
               if strcmp(poplist{2}(1:5),'More ')
                  val = 3;
               else
                  val = 2;
               end
            else
               val = 2;
            end         
            helpwindm(poplist{val});  % gets first reference in 'See also' list.
            
         end
      end

      % If there are dashes follow the function link.
      if ~isempty(dash)
         if any(ln == dash)
            loc = min(findstr('-',helpstr(ln,:)));
            ref = deblank(helpstr(ln,1:loc-1));
            ind = min(find(isletter(ref)));
            ref = ref(ind:end);
            % Process a 'Readme' tag.
            if strcmp(ref,'Readme')
               CurHelpEdit = findobj(fig,'Tag','CurHelpEdit');
               pre = deblank(get(CurHelpEdit,'string'));
               if (pre(1)==' '), pre(1) = []; end
               helpwindm([pre filesep ref]);
            % Else, just follow the link.   
            else
               helpwindm(ref);
            end
         end
      end

   end

%-----------------------------------------------------------------------
case 'HelpwinHelpDesk'
   % This case is used to link HTML-based documentaion.
   HelpDeskBtn = gcbo;
   val = get(HelpDeskBtn,'value');
   if val~=1
     	set(HelpDeskBtn,'value',1);
     	switch val
     	case 3,
     		display_file(which('DiffMan_ug.pdf'));
     	case 4,
   	   	    web('http://www.math.ntnu.no/num/diffman/');
   	    otherwise,
   		    doc;
   	    end;
   end;
   

%   doc;   %dmmod Added the lines above, instead of this.
   
%-----------------------------------------------------------------------
case 'HelpwinMoreHelp'
   % This case is used to link HTML-based documentaion.
   nexttopic = get(findobj(gcbf,'tag','CurHelpEdit'),'string');
   if nexttopic(1) == ' ', nexttopic(1) = []; end  % remove first char if space
   doc(nexttopic);

%-----------------------------------------------------------------------
case 'HelpwinResize'
   % This case is used to reset the position of the buttons and the
   % frames is the helpwin figure is resized.

   % Get the new figure position in points.
   fig = gcbf;
   pos = get(fig,'Position');
   figwidth = pos(3);

   % Get all of the necessary handles.
   ListBox = findobj(fig,'tag','ListBox');
   CurHelpEdit = findobj(fig,'tag','CurHelpEdit');
   SeeAlsoPop = findobj(fig,'tag','SeeAlsoPop');
   HomeBtn = findobj(fig,'tag','HomeBtn');
   BackBtn = findobj(fig,'tag','BackBtn');
   ForwardBtn = findobj(fig,'tag','ForwardBtn');
   HelpDeskBtn = findobj(fig,'tag','HelpDeskBtn');
   HelpBtn = findobj(fig,'tag','HelpBtn');
   CloseBtn = findobj(fig,'tag','CloseBtn');
   
   % Set the top frame and buttons to their correct positions.
   wid = 170; wid2 = 60; spc = 8;
   ht = 21;   frmht = 54;
   [fname,fsize,bdr] = goodfonts(computer);

   set(CurHelpEdit,'Position',[spc pos(4)-frmht+ht+8 2*wid2+spc ht]);
   set(SeeAlsoPop,'Position',[2*wid2+3*spc pos(4)-frmht+ht+8 2*wid2+spc ht]);
   set(HomeBtn,'Position',[2*wid2+3*spc pos(4)-frmht+4 wid2 ht]);
   set(BackBtn,'Position',[spc pos(4)-frmht+4 wid2 ht]);
   set(ForwardBtn,'Position',[wid2+2*spc pos(4)-frmht+4 wid2 ht]);
   set(HelpDeskBtn,'Position',[figwidth-2*(wid2+spc) pos(4)-frmht+ht+8 2*wid2+spc ht]);
   set(HelpBtn,'Position',[figwidth-2*(wid2+spc) pos(4)-frmht+4 wid2 ht]);
   set(CloseBtn,'Position',[figwidth-(wid2+spc) pos(4)-frmht+4 wid2 ht]);
   
   % Set the list box to fill the rest of the figure.
   set(ListBox,'Position',[bdr 0 pos(3) pos(4)-frmht]);
      
%-----------------------------------------------------------------------
otherwise

   % Try to find the figure.  Note the awkward spelling of the tag to prevent
   % others from accidentally grabing this hidden figure.
   fig = findobj(allchild(0),'tag','MiniDMHelPFigurE');
   CR = sprintf('\n');

   % Determine if the input consists of a cell array or paged help text.
   topic_is_cell = iscell(topic);
   multi_page_text = topic_is_cell & (size(topic,2) > 1);
   
   % Strip off the first character if it is a space.  The space is inserted
   % on purpose for better display in the edit box.
   if ~topic_is_cell & size(topic,1) == 1 & topic(1)==' ' , topic(1) = []; end

   % Create the figure if it doesn't exist.
   if isempty(fig),
      % Params.
      wid = 170; wid2 = 60; spc = 8;
      ht = 21;   frmht = 54;

      % Get a good font and figure size for this platform.
      [fname,fsize,bdr] = goodfonts(computer);
      
      % Create the figure.
      fig = figure( ...
         'Visible','off', ...
         'HandleVisibility','off', ...
         'MenuBar','none', ...
         'Name','DiffMan Help Window', ...
         'Color',get(0,'defaultuicontrolbackgroundcolor'), ...
         'NumberTitle','off', ...
         'IntegerHandle','off', ...
         'Units','Points', ...
         'ResizeFcn','helpwindm(''HelpwinResize'')', ...
         'Tag','MiniDMHelPFigurE');
      
      % Test the chosen font to get the best figure width.
      str = ['01234567890123456789012345678901234567890123456789012345678901234567890123456789'];
      t = uicontrol('Parent',fig, ...
         'Units','points', ...
         'FontName',fname, ...
         'FontSize',fsize, ...
         'String',str);
      figwidth = get(t,'extent');
      figwidth = figwidth(3)+40;
      %dmmod figwidth = figwidth(3); added line above
      delete(t);
      pos = get(fig,'position');  % Gets default figure position in points.
      bdr = bdr * get(0,'ScreenPixelsPerInch') / 72;  % Convert Pixels to Points.
      figpos = [(2*pos(1) + pos(3) - figwidth)/2 pos(2) figwidth pos(4)] + ...
               [-bdr 0 bdr 0];
      
      % Set the best figure position.
      set(fig,'Position',figpos);
      
      % Create the rest of the UIs.
      ListBox = uicontrol('Parent',fig, ...
         'BackgroundColor',[1 1 1], ...
         'CallBack','helpwindm(''HelpwinOpen'');', ...
         'FontName',fname, ...
         'FontSize',fsize, ...
         'Max',2, ...
         'Units','Points', ...
         'Position',[bdr 0 figwidth pos(4)-frmht], ...
         'String',' ', ...
         'Style','listbox', ...
         'Tag','ListBox', ...
         'Value',[]);
      CurHelpEdit = uicontrol('Parent',fig, ...
         'BackgroundColor',[1 1 1], ...
         'Units','Points', ...
         'Position',[spc pos(4)-frmht+ht+8 2*wid2+spc ht], ...
         'Style','edit', ...
         'HorizontalAlignment','left', ...
         'Tag','CurHelpEdit', ...
         'Callback','helpwindm(get(gcbo,''string''));');
      SeeAlsoPop = uicontrol('Parent',fig, ...
         'BackgroundColor',[1 1 1], ...
         'CallBack','helpwindm(''HelpwinSeealso'');', ...
         'Min',1, ...
         'Units','Points', ...
         'Position',[2*wid2+3*spc pos(4)-frmht+ht+8 2*wid2+spc ht], ...
         'String','See also', ...
         'Style','popupmenu', ...
         'HorizontalAlignment','left', ...
         'Tag','SeeAlsoPop', ...
         'Value',1);
      HomeBtn = uicontrol('Parent',fig, ...
         'CallBack','helpwindm(''HelpwinHome'');', ...
         'Units','Points', ...
         'Position',[2*wid2+3*spc pos(4)-frmht+4 wid2 ht], ...
         'String','Home', ...
         'Tag','HomeBtn');
      BackBtn = uicontrol('Parent',fig, ...
         'CallBack','helpwindm(''HelpwinBack'');', ...
         'Units','Points', ...
         'Position',[spc pos(4)-frmht+4 wid2 ht], ...
         'String','Back', ...
         'UserData',0, ...
         'Tag','BackBtn');
      ForwardBtn = uicontrol('Parent',fig, ...
         'CallBack','helpwindm(''HelpwinForward'');', ...
         'Units','Points', ...
         'Position',[wid2+2*spc pos(4)-frmht+4 wid2 ht], ...
         'String','Forward', ...
         'Tag','ForwardBtn');
      HelpDeskBtn = uicontrol('Parent',fig, ...
         'BackgroundColor',[1 1 1], ...
         'Units','Points', ...
         'Position',[figwidth-2*(wid2+spc) pos(4)-frmht+ht+8 2*wid2+spc ht], ...
         'Style','popupmenu', ...
         'HorizontalAlignment','left', ...
         'String',{'Documentation:';...
         'Go to Matlab-Help Desk';'DiffMan Manual (PDF)';...
             'DiffMan Homepage (WWW)'}, ...
         'Tag','HelpDeskBtn', ...
         'Callback','helpwindm(''HelpwinHelpDesk'');');
%dmmod changed button from following:
%       HelpDeskBtn = uicontrol('Parent',fig, ...
%          'Units','Points', ...
%          'Position',[figwidth-2*(wid2+spc) pos(4)-frmht+ht+8 2*wid2+spc ht], ...
%          'Style','Pushbutton', ...
%          'HorizontalAlignment','center', ...
%          'String','Go to Help Desk', ...
%          'Tag','HelpDeskBtn', ...
%          'Callback','helpwindm(''HelpwinHelpDesk'');');
      HelpBtn = uicontrol('Parent',fig, ...
         'CallBack','helpwindm(''helpinfo'');', ...
         'Units','Points', ...
         'Position',[figwidth-2*(wid2+spc) pos(4)-frmht+4 wid2 ht], ...
         'String','Tips', ...
         'Tag','HelpBtn');
      CloseBtn = uicontrol('Parent',fig, ...
         'CallBack','set(gcbf,''visible'',''off'')', ...
         'Units','Points', ...
         'Position',[figwidth-(wid2+spc) pos(4)-frmht+4 wid2 ht], ...
         'String','Close', ...
         'Tag','CloseBtn');
      
      % Set 'Busy Action, Queue' and 'Interruptible, Off' on all objects.
      set(findobj(fig),'BusyAction','queue','Interruptible','off');

   else
      figure(fig);
      ListBox = findobj(fig,'tag','ListBox');
      CurHelpEdit = findobj(fig,'tag','CurHelpEdit');
      SeeAlsoPop = findobj(fig,'tag','SeeAlsoPop');
      HomeBtn = findobj(fig,'tag','HomeBtn');
      BackBtn = findobj(fig,'tag','BackBtn');
      ForwardBtn = findobj(fig,'tag','ForwardBtn');
      HelpDeskBtn = findobj(fig,'tag','HelpDeskBtn');      

   end
   
   % Turn on figure visiblity.
   set(fig,'visible','on');

   % Create Page popup if not necessary and non-existent.  Otherwise, simply
   % load up the help string with the help text for the requested topic.
   if multi_page_text
      % Get the help text for the requested topic from the cell array.
      if nargin < 2
         pagetitle = topic{1,1};
      elseif isempty(pagetitle)
         pagetitle = topic{1,1};
      end
      ind = strmatch(pagetitle,topic(:,1),'exact');
      if isempty(ind), ind = 1; end

      helpstr = char(topic{ind,2});
      slash_n = find(helpstr==CR);
      if slash_n
         % Replace pipes with '!' for display if necessary,
         % replace the carriage returns in the help string with pipes
         % so that the list box can correctly interpret them.
         % Add one extra line to top of display.  
         helpstr(find(helpstr == '|')) = '!';
         helpstr(slash_n) = '|';
         helpstr = ['|' helpstr];
      else
         % Add one extra line to top of display.  
         helpstr = str2mat('',helpstr);
      end

      % Set the popup string.
      ref = [{'Topics'}; topic(:,1)];
      if length(ref) < 2
         set(SeeAlsoPop,'string',ref,...
             'enable','off');
      else
         set(SeeAlsoPop,'string',ref, ...
             'callback','helpwindm(''HelpwinPage'');', ...
             'enable','on',...
             'value',1,...
             'userdata',topic);
      end

      % Set the current topic.
      pgtitle = topic{ind,1};
      
   elseif (iscell(topic) | any(find(topic==32)) | ...
           size(topic,1) > 1 | any(find(topic==CR)))
      helpstr = char(topic);
      slash_n = find(helpstr==CR);
      if slash_n
         % Replace pipes with '!' for display if necessary,
         % replace the carriage returns in the help string with pipes
         % so that the list box can correctly interpret them.
         % Add one extra line to top of display.  
         helpstr(find(helpstr == '|')) = '!';
         helpstr(slash_n) = '|';
         helpstr = ['|' helpstr];
      else
         % Add one extra line to top of display.  
         helpstr = str2mat('',helpstr);
      end

      if nargin < 2
         pgtitle = 'MATLAB Help';
      else
         if isempty(pagetitle)
            pgtitle = 'MATLAB Help';
         else
            pgtitle = pagetitle;
         end
      end
      
   else
      % Get the help text for the requested topic.
      helpstr = help(topic);
      slash_n = 1;
      pgtitle = topic;

      % Error handling.  If topic not found, send an error message to the window.
      if isempty(helpstr)
         helpstr = [CR ' Topic ''' pgtitle ''' was not found.'];
      end

      % Replace pipes with '!' for display if necessary,
      % replace the carriage returns in the help string with pipes
      % so that the list box can correctly interpret them.
      % Add one extra line to top of display.  
      helpstr(find(helpstr == '|')) = '!';
      helpstr(find(helpstr==CR)) = '|';
      helpstr = ['|' helpstr];
         
   end
      
   % Store the arguments in the userdata of the figure.  This is a stack
   % which enables the Back button to work for the last few selections.
   fud = get(fig,'UserData');
   curArg = struct('topic',{[]},'pagetitle',{[]},'helptitle',{[]});
   curArg.topic = topic;
   curArg.pagetitle = pgtitle;
   if nargin >= 3
      curArg.helptitle = helptitle;
   end
   if isempty(fud)
      fud = curArg;  % protects for first time through code.
   else
      backflag = get(BackBtn,'UserData');  % flag to indicate that Back/Forw button was
      if backflag == 0                     % pressed.
         str = get(CurHelpEdit,'string');
         if str(1) == ' ', str(1) = []; end;  % remove first char is space
         match = strmatch(str,{fud.pagetitle},'exact');
         if ~isempty(match)
            fud(1:match-1) = [];     % eliminate the items 'above' the selected items
         end
         fud = [curArg fud];
         if length(fud) >= 7         % limits stack to 6 elements
            fud(7) = [];             % or 5 Back button presses
         end
      else
         set(BackBtn,'UserData',0);  % clear backflag
      end
   end
   set(fig,'UserData',fud);

   % Check to see whether the Back and Forward buttons should be disabled.
   match = strmatch(pgtitle,{fud.pagetitle},'exact');
   if max(match) == length(fud)
      set(BackBtn,'enable','off');
   else
      set(BackBtn,'enable','on');
   end
   if min(match) == 1
      set(ForwardBtn,'enable','off');
   else
      set(ForwardBtn,'enable','on');
   end
   
   % Replace all tabs with single spaces.
   helpstr(find(helpstr==9)) = ' ';
   
   % Set the listbox string to the help string and set the topic name in the
   % edit box.
   set(CurHelpEdit,'string',[' ' pgtitle]);  % extra space for better display.
   set(ListBox,'value',[],'string',helpstr,'ListBoxTop',1);
   
   if any(slash_n) & ~multi_page_text
      % Set up the string for the See Also pop-up
      cnt=1;
      ref={'See also'};
      if ~(any(find(pgtitle==filesep)) | ...
           any(find(pgtitle=='/')) | ...
           any(find(pgtitle(2:end)==' ')))
         ref = {'See also' ['More ' pgtitle ' help (HTML)']};
         cnt = cnt + 1;
      end
      
      % Enable links to the related topics found after the 'See Also'.
      seealso=max(findstr(helpstr,'See also'));  % Finds LAST 'See Also'.
      overind = max(findstr(helpstr,'| Overloaded methods'));
      if ~isempty(seealso)
         p=seealso+8;
         lmask=[zeros(1,p-1) isletter(helpstr(p:end))];
         umask=helpstr==upper(helpstr);
         undmask=helpstr=='_';
         nmask = [zeros(1,p-1) ...
               ((helpstr(p:end) >= '0') & (helpstr(p:end) <= '9'))];
         rmask=lmask&umask | undmask | nmask;
         ln=length(helpstr);
         if ~isempty(overind), ln=overind-1; end
         while 1
            q=p;
            while ~rmask(p) & p<ln
               p=p+1;
            end
            q=p+1;
            if q>=ln, break; end
            while rmask(q)
               q=q+1;
            end
            cnt=cnt+1;
            if q>p+1,  % Protects against single letter references.
               ref{cnt}=lower(helpstr(p:q-1));
            end
            p=q;
         end
      end
   
      % Enable link to overloaded methods.
      if ~isempty(overind)
         ln = length(helpstr);
         eol = find(helpstr(overind+1:ln)=='|');
         p = findstr(helpstr(overind:ln),'help ');
         for i=1:length(p)
            cnt = cnt + 1;
            ref{cnt} = helpstr(overind+p(i)+4:overind+eol(i+1)-1);
         end
         
      end
   
      % Set the See Also popup values.
      set(SeeAlsoPop,'value',1);
      if size(ref,2) < 2
         set(SeeAlsoPop,'string',ref,...
             'enable','off');
      else
         set(SeeAlsoPop,'string',ref, ...
             'callback','helpwindm(''HelpwinSeealso'');', ...
             'enable','on');
      end

   elseif ~multi_page_text 
      set(SeeAlsoPop,'string',{'See also'},...
          'enable','off');

   end   

   % Set the figure title if supplied.
   if nargin >= 3
      if isempty(helptitle)
         set(fig,'Name','DiffMan Help Window');
      else
         set(fig,'Name',helptitle);
      end
   else
      set(fig,'Name','DiffMan Help Window');
   end

   % Set any HG properties that were passed in.
   if ~isempty(varargin)
      narg = length(varargin);
      set(ListBox,varargin(1:2:narg),varargin(2:2:narg))
   end

end

% Done.

%-----------------Function GOODFONTS-----------------
function [fname,fsize,listboxbdr] = goodfonts(computer)
%       Returns a good font for a list box on this platform
%       and return the resulting figure width for an 80 column
%       display.

% fname - string
% fsize - points
% listboxbdr - pixels for frame

switch computer

case 'PCWIN'
   fname = 'Courier';
   fsize = 10;
   listboxbdr = 0;

case 'MAC2'
   fname = 'Monaco';
   fsize = 9;
   listboxbdr = 3;

otherwise
   fname = 'Courier';
   fsize = 10;
   listboxbdr = 0;

end

%-----------------Function DISPLAY_FILE-----------------
function display_file(html_file)
    % Construct URL
    if (strncmp(computer,'MAC',3))
        html_file = ['file:///' strrep(html_file,filesep,'/')];
    end

    % Load the correct HTML file into the browser.
    stat = web(html_file);
    if (stat==2)
        error(['Could not launch Web browser. Please make sure that'  sprintf('\n') ...
        'you have enough free memory to launch the browser.']);
    elseif (stat)
        error(['Could not load HTML file into Web browser. Please make sure that'  sprintf('\n') ...
        'you have a Web browser properly installed on your system.']);
    end

