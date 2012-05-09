function tbxStruct = demos
% DEMOS - Demo list for the DiffMan Toolbox.

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1998.12.07

if (nargout == 0), demo toolbox; return; end;

tbxStruct.Name='DiffMan';
tbxStruct.Type='toolbox';

tbxStruct.Help= ...                                             
        {' The DiffMan Toolbox integrates differential equations ' 
         ' evolving on homogeneous manifolds, and is part of a   ' 
	 ' program for developing coordinate free numerics. For  '
	 ' more information please visit:                        '
	 '                                                       '
	 '        http://www.math.ntnu.no/num/diffman/           '};

tbxStruct.DemoList = {
           % ' Introduction', 'dmdintro',
            ' DiffMan Tutorial', 'dmtutorial',
            ' Command Line Examples', 'dmdexamples'};


