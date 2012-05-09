function [] = dmhelp(hlpstr)
% DMHELP - DiffMan Help Window
%
%                  HELP ON USING DIFFMAN HELP WINDOW:
%                  ---------------------------------
% HOW TO GET HELP:
%    You can type any help-topic in the upper left box of the Help Window.
%    If a line in the main text starts with a help-topic followed by ' - ', 
%    you can also click on it directly. 
%
% EXAMPLES: (click on these, or type them in upper left box)
%    plot            - Help on any matlab functions.
%    liealgebra      - Help on the _directory_ 'liealgebra'.
%    @liealgebra     - Info on the _class_ 'liealgebra'. 
%    @lagl           - Info on the Lie algebra gl(n).
%    @lafree/order   - Function 'order.m' in class 'lafree'. 
% 
% MATLAB HELPINFO:   
%     There are three ways to get online help.  The first two provide
%     simple help information on MATLAB functions, while the third is a
%     huge collection of documentation stored in hypertext format that
%     you access with a Web browser.
%  
%     HELP     - Function help, display help text at command line.
%     HELPWIN  - Function help, separate window for navigation.
%     DMHELP   - An extended and improved version of HELPWIN
%     HELPDESK - Comprehensive hypertext documentation and troubleshooting.
%  
%     See also LOOKFOR, WHICH, DEMO, GENERAL.

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.09.11

% preprocess input to a standard format.
if nargin == 0,
	hlpstr = 'DmHomeBtn';
end;
hlpstr = removeblanks(hlpstr);
%Remove trailing '.m'
if length(hlpstr)>1,
	if strcmp(hlpstr(end-1:end),'.m'),
		hlpstr = hlpstr(1:end-2);
	end;
end;
if isempty(hlpstr),
	hlpstr = 'DmHomeBtn';
end;
%Replace all / with filesep
hlpstr(find(hlpstr=='/')) = filesep;

% Switchyard on 'hlpstr'.  Used in case of button-callbacks
switch hlpstr

%-----------------------------------------------------------------------
case 'CurHelpEdit'
	cbstr = get(gcbo,'string');
	if isempty(cbstr),
		set(gcbo,'string',' '); %empty string crash. Matlab bug!
	end;
	dmhelp(cbstr);
		
%-----------------------------------------------------------------------
case 'HelpwinResize'
	% default position of all helpwindm buttons
	helpwindm('HelpwinResize');
	% customize the positions of our buttons
	dmhbuttonpos;
      
%--------------------------------------------------------------------------
case 'DmHomeBtn',
	fig = dmhelpwincreate; % find helpwin 
	DmHomeBtn = findobj(fig,'tag','DmHomeBtn');
	str = get(DmHomeBtn,'Userdata');
	helpwindm({str},'DiffMan Help Topics');
	
%--------------------------------------------------------------------------
case 'DmViewBtn',
	fig = dmhelpwincreate; % find helpwin 
	CurHelpEdit = findobj(fig,'tag','CurHelpEdit');
	filename = get(CurHelpEdit,'String');
	filename = removeblanks(filename);
	fid = fopen([filename '.m'],'r');
	if fid<0,
		str = ['Error: Cannot open sourcefile!'];
	else;
		str = fread(fid);
		str = setstr(str');
		fclose(fid);
	end;
	longfilename = which(filename);
	str = [longfilename sprintf('\n') sprintf('\n') str];
	helpwindm({str},filename);
	
%--------------------------------------------------------------------------
case 'DmFileBtn',
% list all files in current directory
	fig = dmhelpwincreate; % find helpwin 
	CurHelpEdit = findobj(fig,'tag','CurHelpEdit');
	% find function name
	funcname = get(CurHelpEdit,'String');
	funcname = removeblanks(funcname);
	ffn = which(funcname);
	if isempty(ffn), ffn = ' '; end;
	fsp = find(ffn==filesep);
	if isempty(fsp),
		funcname = get(CurHelpEdit,'String');
		errstr = ['Error: The help topic ' funcname ...
		' does not specify any directory.'];
		helpwindm({errstr},funcname);
		return;
	end;
	mfsp = max(fsp);
	dirname = ffn(1:mfsp);
	if length(fsp)==1,
		shdirname = dirname;
	else;
		shdirname = ffn(fsp(end-1)+1:fsp(end));
	end;
	d = dir([dirname '*.m']);
	% make a list of all m-files in directory
	s = {d.name};
	viewst1 = {};
	viewst2 = {};
	for i = 1:length(s),
		filename = s{i};
		filename = [shdirname filename(1:end-2)];
		viewst1 = [viewst1 ; {['   ' filename]}];
		viewst2 = [viewst2 ; {[' - ' getfrstcomment(filename,50)]}];
   end;
   viewstr = [char(viewst1),char(viewst2)];
   lf = sprintf('\n');
   % turn viewstr into a 1-D string with linefeeds
   lfs = char(lf*ones(size(viewstr,1),1));
   viewstr = [viewstr, lfs];
   viewstr = reshape(viewstr',1,prod(size(viewstr)));
   viewstr = [dirname lf lf viewstr];
   helpwindm({viewstr},'M-file list:');
   
%-----------------------------------------------------------------------
case 'HelpwinOpen' %code cut from helpwin.m, slightly changed.
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
            dmhelp(poplist{val});  % gets first reference in 'See also' list.
            
         end
      end

      % If there are dashes follow the function link.
      if ~isempty(dash)
         if any(ln == dash)
            loc = min(findstr('-',helpstr(ln,:)));
            ref = removeblanks(helpstr(ln,1:loc-1));
            ind = min(find(isletter(ref)));
            if ind>1, if ref(ind-1)=='@',
            	ind = ind-1;
            end; end;
            ref = ref(ind:end);
            % Process a 'Readme' tag.
            if strcmp(ref,'Readme')
               CurHelpEdit = findobj(fig,'Tag','CurHelpEdit');
               pre = removeblanks(get(CurHelpEdit,'string'));
               if (pre(1)==' '), pre(1) = []; end
               dmhelp([pre filesep ref]);
            % Else, just follow the link.   
            else
               dmhelp(ref);
            end
         end
      end
   end
	
%--------------------------------------------------------------------------
otherwise % in this case, the function is not called by callback.
   
% create or find help window
fig = dmhelpwincreate;
fs = filesep;
% fix helpstring
if strcmp(hlpstr,'diffman')|strcmp(hlpstr,'Diffman')|strcmp(hlpstr,'diffMan'),  	
	  hlpstr = 'DiffMan';
end;
% we want to find all alternative hits.
str2 = [hlpstr fs 'Contents']; % try first hlpstr/Contents
s = which(str2,'-all');
if isempty(s),
	  s = which(hlpstr,'-all');
else, % hlpstr/Contents found.
   hlpstr = str2;
end;
% throw out all findings that are not .m files.
for i = length(s):-1:1,
	fname = s{i};
	if ~strcmp(fname(end-1:end),'.m'),
		s(i) = [];
	end;
end;
if isempty(s),
	helpwindm(hlpstr); % nothing found. give up
	% disable 'M-Files' and 'View src'
    return;
end;
% if we have still found multiple files, and hlpstr has no fs,
% then list the alternative findings.
if (length(s)>1) & isempty(find(hlpstr==fs)),
	viewst1 = {};
	viewst2 = {};
	for i = 1:length(s),
	   fullfilename = s{i};
	   fslist = find(fullfilename==fs);
	   shfnam = fullfilename(fslist(end-1)+1:end-2);
	   viewst1 = [viewst1 ; {['   ' shfnam]}];
   	   viewst2 = [viewst2 ; {[' - ' getfrstcomment(shfnam,50)]}];
   end;
   viewstr = [char(viewst1),char(viewst2)];
   lf = sprintf('\n');
   % turn viewstr into a 1-D string with linefeeds
   lfs = char(lf*ones(size(viewstr,1),1));
   viewstr = [viewstr, lfs];
   viewstr = reshape(viewstr',1,prod(size(viewstr)));
   viewstr = ['There is more than one ' hlpstr ' available. ' ...
               'Click on the one you want:' lf lf viewstr];
   helpwindm({viewstr},hlpstr);
   return;
end;   	  
% in case of still ambiguity, pick last hit
fullfilename = s{end};
fslist = find(fullfilename==fs);
funcname = fullfilename(fslist(end-1)+1:end-2);

if (~isempty(findstr(funcname,'Contents'))) | isempty(find(funcname=='@'));
	helpwindm(funcname);
	return;
else; % it is a file in a class directory that is not 'Contents.m'. Extract info.
	nl = sprintf('\n');
	hlpstr = ['   Documentation in ' funcname ' :              '];
	minusstr = char('-'*ones(1,60));
	hlpstr = [minusstr nl hlpstr nl minusstr nl nl];	
	hlp = help(funcname);
	hlpstr = [hlpstr hlp nl nl];
	lasta = max(find(funcname=='@'));
	lastfs = max(find(funcname==filesep));
	meth = funcname(lastfs+1:end);
	classname = funcname(lasta:lastfs);
	contname = [classname 'Contents'];
	hlpstr = [hlpstr minusstr nl '   Documentation extracted from ' nl ...
	      '      ' contname ' - (click here to see all)' nl minusstr nl];
	hlp = help(contname);
	hlp = dmfinddoc(hlp,meth);
	hlpstr = [hlpstr hlp];
	helpwindm({hlpstr},funcname);
	return;
end;		

end; % end of main switch statement
return;

%===========================================================================
function [str2] = removeblanks(str);
str2 = str(find(~isspace(str)));
return;

%===========================================================================
function [] = dmhbuttonpos;
% customize the positions of buttons

fig = findobj(allchild(0),'tag','MiniDMHelPFigurE');
SeeAlsoPop = findobj(fig,'tag','SeeAlsoPop');
CurHelpEdit = findobj(fig,'tag','CurHelpEdit');
HelpBtn = findobj(fig,'tag','HelpBtn');
DmHomeBtn = findobj(fig,'Tag','DmHomeBtn');
DmFileBtn = findobj(fig,'Tag','DmFileBtn');
DmViewBtn = findobj(fig,'tag','DmViewBtn');
ForwardBtn = findobj(fig,'tag','ForwardBtn');
HomeBtn = findobj(fig,'tag','HomeBtn');
CloseBtn = findobj(fig,'tag','CloseBtn');
HelpDeskBtn = findobj(fig,'tag','HelpDeskBtn');

chep = get(CurHelpEdit,'Position');
sapp = get(SeeAlsoPop,'Position');
hombp = get(HomeBtn,'Position');
hbp = get(HelpBtn,'Position');
fbp = get(ForwardBtn,'Position');
cbp = get(CloseBtn,'Position');
hdbp = get(HelpDeskBtn,'Position');

pos = hombp;
pos(1) = 2*hombp(1)-fbp(1);
set(DmHomeBtn,'Position',pos);

pos = hbp;
pos(1) = 2*hbp(1)-cbp(1);
set(DmFileBtn,'Position',pos);
dmfbp = pos;

pos = sapp;
pos(3) = hombp(1)+hombp(3)-fbp(1);
set(SeeAlsoPop,'Position',pos);

pos = dmfbp;
pos(2) = hdbp(2);
set(DmViewBtn,'Position',pos);
return;

%===========================================================================
function [strout] = dmfinddoc(str,fname)
% finds documentation about a function with name fname in a
% diffman Contents.m file

% finds the string 'function [.......fname' in str. 
funcpos = findstr(str,' function [');
fnampos = findstr(str,fname);
% run through all occurrences of fname, check which is closest to
% a 'function [' string.

if isempty(funcpos) | isempty(fnampos),
	strout = ''; %empty string => not found
	return;
end;

pmin = inf;
pminpos = -1;
for i = fnampos,
	diff = i-funcpos;
	diff(find(diff<0)) = inf;
	[m,p] = min(diff);
	if m<pmin,
		pmin = m;
		pminpos = p;
	end;
end;

if pminpos < 0,
	strout = '';
	return;
end;
pos = funcpos(pminpos); % this is the position of the function

% find closest paragraph start before pos.
pgr = paragraphs(str);
diff = pos-pgr;
diff(find(diff<0)) = inf;
[m,p] = min(diff);
sectstart = pgr(p);

% find a paragraphstart that is as big as possible, but before next
% 'function [' string
if pminpos==length(funcpos),
	sectend = length(str);
else;
	nxtfunc = funcpos(pminpos+1);
	diff = nxtfunc-pgr;
	diff(find(diff<0)) = inf;
	[m,p] = min(diff);
	sectend = pgr(p);
end;
strout = str(sectstart:sectend);
return;

%===========================================================================
function [pgr] = paragraphs(str)
% finds where all paragraphs in the string starts
% paragraph is two newlines with only whitespace in between.
%
% The first and last positions in str are in pgr.

nl = sprintf('\n');
newlines = find(str==nl);
pgr = [1];
for i = 1:length(newlines)-1,
	interv = newlines(i):newlines(i+1);
	if all(isspace(str(interv))),
		pgr = [pgr, newlines(i+1)];
	end;
end;
if pgr(end) ~= length(str),
	pgr = [pgr,length(str)];
end;
return;


%===========================================================================
function [str] = getfrstcomment(file,nchar)
% get first comment line of the file, first nchar charaters
str = help(file);
if isempty(str),
	return;
end;
lf = sprintf('\n');
str = str(1:min(find(str==lf))-1);
if nargin==2,
	lng = min(nchar,length(str));
	str = str(1:lng);
end;
return;

%===========================================================================
function [fig] = dmhelpwincreate()
% create or find diffmanstyle help window
% return handle

fig = findobj(allchild(0),'tag','MiniDMHelPFigurE');
if isempty(fig),
	helpwindm({' '},' ');
    fig = findobj(allchild(0),'tag','MiniDMHelPFigurE');
end;

DmHomeBtn = findobj(fig,'Tag','DmHomeBtn');
if isempty(DmHomeBtn), % window is not already customized
	%Customize
	set(fig,'ResizeFcn','dmhelp(''HelpwinResize'');');
	%Add DiffMan-Home button -------------------------------------------
	% Find all Contents.m files in DiffMan
	csp = which('Contents.m','-all');
	str = {'General helpfiles:'};
	comments = {' '};
	% add first all m-files in documentation directory
	[dmp,fs] = dmpath;
	docpth = [dmp fs 'auxiliary' fs 'documentation' fs '*.m'];
	d = dir(docpth);
	hcomments = {};
	ccomments = {};
	for i = 1:length(d);
		stri = d(i).name;
		stri = stri(1:end-2); %remove '.m'
		str = [str ; {['   ' stri]}];
		comments = cat(1,comments,{[' - ' getfrstcomment(stri,50)]});
	end;
	hstr = {};
	hcomments = {};
	ccomments = {};
	cstr = {};
	fs = filesep;
	for i = 1:length(csp),	
		stri = csp{i};
		if (length(dmp) <= length(stri)) & strcmp(stri(1:length(dmp)),dmp), 
			filsep = find(stri==fs);
			if length(filsep)>1,
				stri = stri((filsep(end-1)+1):(filsep(end)-1));
				if stri(1) == '@';
					cstr = [cstr; {stri}]; % classes
					ccomments = cat(1,ccomments,...
					   {[' - ' getfrstcomment([stri fs 'Contents'],50)]});
				else;
					hstr = [hstr; {stri}]; % directories
					hcomments = cat(1,hcomments,...
					   {[' - ' getfrstcomment([stri fs 'Contents'],50)]});
				end;
			end;
		end;
	end;
	str = [str; {'Classes:'}];
	comments = [comments; {' '} ;ccomments];
	for i = 1:length(cstr);
		str = [str ; {['   ' cstr{i}]}];
	end;
	str = [str; {'Directories:'}];
	comments = [comments; {' '} ;hcomments];
	for i = 1:length(hstr);
		str = [str ; {['   ' hstr{i}]}];
	end;
	str = char(str);
	comments = char(comments);
	str = [str,comments];
	% turn str into a 1-D string with linefeeds
	lfs = char(sprintf('\n')*ones(size(str,1),1));
	str = [str, lfs];
	str = reshape(str',1,prod(size(str)));
	DmHomeBtn = uicontrol('Parent',fig, ...
         'CallBack','dmhelp(''DmHomeBtn'');', ...
         'Units','Points', ...
         'String','DM-Home', ...
         'Tag','DmHomeBtn','Userdata',str);
	%Add button to list all files in a directory ---------------------------
	DmFileBtn = uicontrol('Parent',fig, ...
         'CallBack','dmhelp(''DmFileBtn'');', ...
         'Units','Points', ...
         'String','M-files', ...
         'Tag','DmFileBtn');
	%Add button to view source code ----------------------------------------
	DmViewBtn = uicontrol('Parent',fig, ...
         'CallBack','dmhelp(''DmViewBtn'');', ...
         'Units','Points', ...
         'String','View src', ...
         'Tag','DmViewBtn');
	%Fix various things
	CurHelpEdit = findobj(fig,'tag','CurHelpEdit');
	set(CurHelpEdit,'Callback','dmhelp(''CurHelpEdit'');');
	HelpBtn = findobj(fig,'tag','HelpBtn');
	set(HelpBtn,'Callback','dmhelp(''dmhelp'');');
	ListBox = findobj(fig,'Tag','ListBox');
	set(ListBox,'Callback','dmhelp(''HelpwinOpen'');');
	HomeBtn = findobj(fig,'tag','HomeBtn');
	set(HomeBtn,'string','ML-Home');
	%Place buttons in right positions	
	dmhbuttonpos;
end;
return;

