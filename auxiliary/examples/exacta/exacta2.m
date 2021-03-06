function [out] = exacta2()
% Example from the paper: "Lie-group methods", Acta Numerica 2000, pp 215-365.
%
% DiffMan must be initalized.
% >> pwd
% ..../DiffMan
% >> dminit
% ....  
% >> exacta2

disp(' ');
disp(' ==> PARTICLE MOVING IN THE EARTHS MAGNETIC FIELD! <==');
disp(' ');
disp(' ==> Integrated with a classical method!');
disp(' ');
disp(' ==> This example is taken from the paper:');
disp(' ==> ''Lie-group methods'', Acta Numerica 2000, pp 215-365.');
disp(' ');
disp(' ==> Starting the simulation.');
disp(' ');
disp('     ..... integrating from 0 -> 500 with stepsize 0.1 ... ');
disp(' ');

magparclas([0 -2.5 0]',12e-3*[0 0 1]',500,-0.1);

disp(' ==> done');
return;
