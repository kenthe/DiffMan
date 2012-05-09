function [] = display(obj)
% DISPLAY - Display a HMLIE.
% function [] = display(obj)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMSHOWSHAPE DMSHOWDATA

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

disp('Class: hmlie');
if all(size(obj) == [1 1]),
  sh = obj.shape;
  shcls = class(sh);
  if DMSHOWSHAPE,
    disp('Shape-object information:');
    disp(['   Class: ' shcls]);
    shsh = getshape(sh);
    if strcmp(shcls,'lgtangent'),
      disp(['   Shape: ' hmshstr(shsh)]);
      if ~isempty(obj.data) & DMSHOWDATA,
        disp('(1): Group-object data:');
        disp(obj.data{1});
        disp('(2): Algebra-object data:');
        disp(obj.data{2});
      end;
    elseif strcmp(shcls,'lgdirprod'),
      disp(['   Shape: ' hmshstr(shsh)]);
      if ~isempty(obj.data) & DMSHOWDATA,
        disp('Data:');
        celldisp(obj.data);
      end;
    elseif hasshape(sh)&~isempty(shsh),
      disp(['   Shape: ' int2str(shsh)]);
      if ~isempty(obj.data) & DMSHOWDATA,
        disp('Data:');
        disp(obj.data);
      end;
    end;
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
return;


