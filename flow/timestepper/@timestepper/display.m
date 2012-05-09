function [] = display(obj)
% DISPLAY - Display a TIMESTEPPER object.
% function [] = display(obj)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Dec.
% LAST MODIFIED BY : Kenth Engø, 2000.04.18

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

if strcmp(class(obj),'timestepper'),    % Display object of TIMESTEPPER class.
  disp('Class:  timestepper (Virtual superclass)');
else,					% Display object in daugther class.
  disp(['Class:  ' class(obj)])
  disp(['Coord.: ' getcoordinate(obj)]);
  meth = getmethod(obj);
  if isfield(meth,'RKname'),
    disp(['Method: ' meth.RKname]);
  elseif isfield(meth,'PRKname'),
    disp(['PRK-coeff.: ' meth.PRKname]);
  else
    disp(['Method: ' meth.name]);
  end;
end;
return;
