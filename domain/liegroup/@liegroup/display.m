function [] = display(obj)
% DISPLAY - Display a LIEGROUP object, or objects from a daugther class. 
% function [] = display(obj)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

global DMSHOWSHAPE DMSHOWDATA

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

if strcmp(class(obj),'liegroup'), % display objects of class LIEGROUP
  disp('Class: liegroup (Virtual superclass)');
else % display object in a particular liegroup (daugther class)
  lgr = class(obj);
  disp(['Class: ' lgr '(' getnumberfield(obj) ')']);
  if all(size(obj) == [1 1]),
    if hasshape(obj),
      sh = getshape(obj);
      if (~isempty(sh) & DMSHOWSHAPE),
	disp(['Shape: ' int2str(sh)]);
      end;
    end;
    if hasmatrix(obj),
      m = getmatrix(obj);
    else
      m = getdata(obj);
    end;
    if (~isempty(m) & DMSHOWDATA),
      disp('Data:');
      disp(m);
    end;
  else % The object is an array of objects
    [m,n] = size(obj);
    disp(['Size:  ' num2str(m) 'x' num2str(n)]);
    disp('Fieldnames:');
    fields = fieldnames(obj);
    for i = 1:length(fields)-1,
      disp(['       ' fields{i}]);
    end;
    disp(' ');
  end;
end;
return;


