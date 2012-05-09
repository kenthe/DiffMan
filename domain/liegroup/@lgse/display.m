function display(obj)
% DISPLAY - Display an LGSE object.
% function display(obj)

% WRITTEN BY       : Kenth Engø, 1998.01.15
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMSHOWSHAPE DMSHOWDATA

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

if strcmp(class(obj),'lgse'), 
  disp(['Class: lgse(R)']);
  if all(size(obj) == [1 1]),
    sh = getshape(obj);
    if ~isempty(sh) & DMSHOWSHAPE,
      disp(['Shape: ' int2str(sh)]);
    end;
    m = getmatrix(obj);
    if ~(isempty(m{1}) & isempty(m{2})) & DMSHOWDATA,
      disp('Matrix:');
      disp(m{1});
      disp('Vector:');
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
