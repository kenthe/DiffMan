function display(obj)
% DISPLAY - Display a HMTOP object.
% function display(obj)

% WRITTEN BY       : Kenth Engø, 1998.01.26
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMSHOWSHAPE DMSHOWDATA

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

disp(['Class: hmtop']);
if isempty(obj.shape), return; end;

if DMSHOWSHAPE,
  disp('Shape-object information:');
  disp(['   Class: lase(R)']);
  disp(['   Shape: ' int2str(getshape(obj(1).shape)) ]);
end;  

if all(size(obj) == [1 1]),
  m = obj.data;
  if ~(isempty(m{1}) & isempty(m{2})) & DMSHOWDATA,
    disp('Angular momentum:');
    disp(m{1});
    disp('Gravity vector:');
    disp(m{2});
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
