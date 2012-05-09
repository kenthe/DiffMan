function [str] = basvec2str(id,i)
% BASISVEC2STR - Diffman: LIEALGEBRA class LAFREE private function
%                Turn basis vector i into a string
%                Id is the identity of the algebra

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Eng¯, 1997.11.12

if (nargin ~= 2)|(nargout > 1),
  error('Wrong number of input/output arguments!');
end;

global LAFREEDATA;
c1 = LAFREEDATA(id).basiscomp(i,1);
c2 = LAFREEDATA(id).basiscomp(i,2);
if c1 == 0,
   str = int2str(i);
else,
   str = ['[' basvec2str(id,c1) ',' basvec2str(id,c2) ']'];
end;
return;
