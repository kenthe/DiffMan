function [] = display(obj)
% DISPLAY - Display a HMANIFOLD object, or objects from daugther classes.
% function [] = display(obj)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMSHOWSHAPE DMSHOWDATA

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

if strcmp(class(obj),'hmanifold'), % display objects of class HMANIFOLD
  disp('Class: hmanifold (Virtual superclass)');
else % display object in a particular hmanifold (daugther class)
  disp(['Class: ' class(obj)]);
  if all(size(obj) == [1 1]),
    if hasshape(obj),
      sh = getshape(obj);
      if isobject(sh) & DMSHOWSHAPE,
	disp('Shape-object information:');
        shcls = class(sh);
        disp(['   Class: ' shcls '(' getnumberfield(sh) ')' ]);
        shsh = getshape(sh);
        if hasshape(sh)&~isempty(shsh),
	  disp(['   Shape: ' int2str(shsh)]);
        end;
      elseif DMSHOWSHAPE,
	if ~isempty(sh),
	  disp(['Shape: ' int2str(sh)]);
	end;
      end;
    end;
    m = getdata(obj);
    if ~isempty(m) & DMSHOWDATA,
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


