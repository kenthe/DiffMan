function [] = display(obj)
% DISPLAY - Display an LADIRPROD object.
% function [] = display(obj)

% WRITTEN BY       : Kenth Eng�, 1997 Oct.
% LAST MODIFIED BY : Kenth Eng�-Monsen, 2019.11.05

global DMSHOWDATA DMSHOWSHAPE

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

disp('Class: ladirprod');
if iscellempty(obj(1).shape), return; end;

if DMSHOWSHAPE,
  disp(['Shape: ' shapestr(obj(1).shape)]);
end;

if all(size(obj) == [1 1]),
  data  = obj.data;
  if ~iscellempty(data) & DMSHOWDATA,
    for i = 1:obj.n,
      sh = obj.shape{2}(i,:);
      dat = data{i};
      if ~isempty(dat)
        if ~iscell(dat),
          disp(['(' int2str(i) '): Data of ' shapestr(sh) '-object:']);
          disp(dat);
        else,
          n = length(dat);
          if ~iscellempty(dat),
            disp(['(' int2str(i) '): Data of ' shapestr(sh) '-object:']);
            for j = 1:n,
              if ~isempty(dat{j}), 
                disp(['  Sub-data #' int2str(j) ':']);
                disp(dat{j});
              end;
            end;
          end;
	end;
      end;
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
