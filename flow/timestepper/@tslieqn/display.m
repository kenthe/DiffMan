function [] = display(obj)
% DISPLAY - Display a TSLIEQN object.
% function [] = display(obj)

% WRITTEN BY       : Hans Munthe-Kaas, 2000.01.27
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

disp(['Class:  ' class(obj)]);
disp(['Method: Gauss-Legendre ' num2str(obj.ord)]);
return;
