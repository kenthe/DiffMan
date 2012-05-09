function [out] = expolar1()
% Rererence: "Recurrence relation for the factors in the polar 
%             decomposition on Lie groups", Reports in Informatics
%             NO 192, May 2000, by Antonella Zanna.
%
% DiffMan must be initalized.
% >> pwd
% ..../DiffMan
% >> dminit
% ....  
% >> expolar1

disp(' ');
disp(' ==> RECURRENCE RELATION FOR FACTORS IN THE <==');
disp(' ==> POLAR DECOMPOSITION ON LIE GROUPS      <==');
disp(' ');
disp(' ==> Reference:');
disp(' ==>  ''Recurrence relation for the factors in the polar');
disp(' ==>   decomposition on Lie groups'', Reports in Informatics');
disp(' ==>   NO 192, May 2000, by Antonella Zanna.');
disp(' ');
disp(' ==> Calculating free Lie algebra expressions for the factors X and Y: ');
disp(' ');

format rat
[x,y] = lafpolar(6);

disp(' ');
disp('     The free Lie algebra expression for X:');
x
disp(' ');
disp('     The free Lie algebra expression for Y:');
y
disp(' ');
disp(' ==> done');
return;
