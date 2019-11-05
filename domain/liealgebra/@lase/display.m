function display(obj)
% DISPLAY - Display an LASE object.
% function display(obj)

% WRITTEN BY       : Kenth Engø, 1998.01.16
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMSHOWSHAPE DMSHOWDATA

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

if strcmp(class(obj),'lase'), 
  disp(['Class: lase(R)']);
  if all(size(obj) == [1 1]),
    sh = obj.shape;
    if ~isempty(sh) & DMSHOWSHAPE,
      disp(['Shape: ' int2str(sh)]);
    end;
    m = obj.data;
    if ~(isempty(m{1}) & isempty(m{2})) & DMSHOWDATA,
      disp('Data-vector #1:');
      disp(m{1});
      disp('Data-vector #2:');
      disp(m{2});
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
