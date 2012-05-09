function [a,b,c] = rkgauss(ord)
if ord ==2,
   a = [1/2];
   b = 1;
   c = 1/2;
   return;
end;
if ord == 4,
   a = [1/4 1/4-sqrt(3)/6;
        1/4+sqrt(3)/6 1/4];
   b = [1/2 1/2]';
   c = [1/2-sqrt(3)/6 1/2+sqrt(3)/6]';
   return;
end;
if ord == 6,
   a = [5/36              2/9-sqrt(15)/15  5/36-sqrt(15)/30;
        5/36+sqrt(15)/24        2/9        5/36-sqrt(15)/24;
        5/36+sqrt(15)/30  2/9+sqrt(15)/15       5/36       ];
   b = [5/18 4/9 5/18]';
   c = [1/2-sqrt(15)/10  1/2  1/2+sqrt(15)/10]';
   return;
end;
if ord == 8, %taken from sanz-serna & calvo
   om1 = 1/8-sqrt(30)/144;
   om1p = 1/8+sqrt(30)/144;
   om2 = (1/2)*sqrt((15+2*sqrt(30))/35);
   om2p = (1/2)*sqrt((15-2*sqrt(30))/35);
   om3 = om2*(1/6 + sqrt(30)/24);
   om3p = om2p*(1/6 - sqrt(30)/24);
   om4 = om2*(1/21 + 5*sqrt(30)/168);
   om4p = om2p*(1/21 - 5*sqrt(30)/168);
   om5 = om2 - 2*om3;
   om5p = om2p - 2*om3p;
   b = [2*om1 2*om1p 2*om1p 2*om1]';
   a = [om1          om1p-om3+om4p  om1p-om3-om4p  om1-om5;
        om1-om3p+om4 om1p           om1p-om5p      om1-om3p-om4;
        om1+om3p+om4 om1p+om5p      om1p           om1+om3p-om4;
        om1+om5      om1p+om3+om4p  om1p+om3-om4p  om1         ];
   c = zeros(4,1);
   for i = 1:4,
   for j = 1:4,
      c(i) = c(i)+a(i,j);
   end;
   end;
   return;
end;
error('That order of RK-GAUSS is not implemented.');