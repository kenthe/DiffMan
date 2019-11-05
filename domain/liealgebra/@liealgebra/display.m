function [] = display(obj)
% DISPLAY - Display a LIEALGEBRA object, or objects from a daugther class.
% function [] = display(obj)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 March.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMSHOWSHAPE DMSHOWDATA

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

if strcmp(class(obj),'liealgebra'), % display objects of class LIEALGEBRA
  disp('Class: liealgebra (Virtual superclass)');
else, % display object in a particular liealgebra (daugther class)
  lal = class(obj);
  disp(['Class: ' lal '(' getnumberfield(obj) ')'])
  if all(size(obj) == [1 1]),
    if hasshape(obj),
      sh = getshape(obj);
      if (~isempty(sh) & DMSHOWSHAPE),
	disp(['Shape: ' int2str(sh)]);
      end;
    end;
    if hasmatrix(obj),
      m = getmatrix(obj);
    else,
      m = getvector(obj);
    end;
    if (~isempty(m) & DMSHOWDATA),
      disp('Data:');
      disp(m);
    end;
  else % The object is an array of objects
    [m,n] = size(obj);
    disp(['Size:  ' int2str(m) 'x' int2str(n)]);
    disp('Fieldnames:');
    fields = fieldnames(obj);
    for i = 1:length(fields)-1,
      disp(['       ' fields{i}]);
    end;
    disp(' ');
  end;
end;
return;
