function [] = display(obj)
% DISPLAY - Display a TSLIEQN object.
% function [] = display(obj)

% WRITTEN BY       : Hans Munthe-Kaas, 2000.01.27

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

  disp(['Class:  ' class(obj)]);
  disp(['Method: Gauss-Legendre ' num2str(obj.ord)]);
return;
