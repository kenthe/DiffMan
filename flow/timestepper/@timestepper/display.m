function [] = display(obj)
% DISPLAY - Display a TIMESTEPPER object.
% function [] = display(obj)

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Dec.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

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
