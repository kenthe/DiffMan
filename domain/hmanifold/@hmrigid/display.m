function display(obj)
% DISPLAY - Display a HMRIGID object.
% function display(obj)

% WRITTEN BY       : Kenth Engø, 1998.09.15
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMSHOWSHAPE DMSHOWDATA

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

disp(['Class: hmrigid']);
if ~isempty(obj(1).shape) & DMSHOWSHAPE,
  disp('Shape-object information:');
  disp(['   Class: laso(R)']);
  disp(['   Shape: ' int2str(getshape(obj(1).shape)) ]);
end;
if all(size(obj) == [1 1]),
  m = obj.data;
  if ~isempty(m) & DMSHOWDATA,
    disp('Angular momentum:');
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
