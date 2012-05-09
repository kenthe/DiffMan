function display(obj)
% DISPLAY - Display a HMSINEEULER object.

% WRITTEN BY       : Kenth Engø, 1999 Mar.
% LAST MODIFIED BY : Kenth Engø, 1999 Sept.

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

disp(['Class: hmsineeuler']);
if isempty(obj.shape), return; end;

disp('Shape-object information:');
disp(['   Class: lasu(' getnumberfield(obj(1).shape) ')']);
disp(['   Shape: ' int2str(getshape(obj(1).shape)) ]);
  
if all(size(obj) == [1 1]),
  m = obj.data;
  if ~isempty(m),
    disp('Data:');
    disp(m);
  end;
else, % The object is an array of objects
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
