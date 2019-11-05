%-*-text-*-
function [] = display(obj)
% DISPLAY - Display an LATANGENT object.
% function [] = display(obj)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMSHOWDATA DMSHOWSHAPE

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

disp('Class: latangent');
if iscellempty(obj(1).shape), return; end;

shstr = shapestr(obj(1).shape);
if DMSHOWSHAPE,
  disp(['Shape: ' shstr]);
end;

if all(size(obj) == [1 1]),
  data = obj.data;
  sh   = obj.shape;
  if strcmp(sh{1},'latangent'),
    if ~iscellempty(data) & DMSHOWDATA,     
      disp(['(1): Algebra-object data:']);
      celldisp(data{1});
      disp(['(2): Algebra-object data:']);
      celldisp(data{2});
    end;
  elseif strcmp(sh{1},'ladirprod'),
    if ~iscellempty(data) & DMSHOWDATA,     
      disp(['(1): Algebra-object data:']);
      celldisp(data{1});
      disp(['(2): Algebra-object data:']);
      celldisp(data{2});
    end;
  elseif strcmp(sh{1},'lasemprod'),
    error('.... how do I display lasemprods ? ...')
  else % Matrix Lie algebra
    if ~iscellempty(data) & DMSHOWDATA,
      disp(['(1): Algebra-object data:']);
      disp(data{1});
      disp(['(2): Algebra-object data:']);
      disp(data{2});
    end;
  end;
else % The object is an array of objects
  [m,n] = size(obj);
  disp(['Size:  ' int2str(m) 'x' int2str(n)]);
  disp('Fieldnames:');
  fields = fieldnames(obj);
  for i = 2:length(fields)-1,
    disp(['       ' fields{i}]);
  end;
end;
return;
