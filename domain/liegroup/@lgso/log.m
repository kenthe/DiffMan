function [v] = log(a)
% LOG - Computes the logarithm from LGSO to LASO.
% function [v] = log(a)
%
% REMARK: For the case where the shape equals 3, this routine
%         uses, if 'dmoptimized on', 13 flops.

% WRITTEN BY       : AM & KE, 1999.04.09
% LAST MODIFIED BY : None 

global DMARGCHK DMOPTIMIZE

if DMARGCHK
  if ~isa(a,'lgso'),
    error('Second input argument is not of class LGSO');
  end;
end;

mat = a.data;
v = laso(a.shape,a.field);

if DMOPTIMIZE & (a.shape == 3),
  trS = mat(1,1) + mat(2,2) + mat(3,3);
  phi = acos((trS-1)/2);

  if (phi > pi), error('phi > pi'); end;
  if (trS == -1), error('tr(mat) = -1'); end;

  adat = zeros(3,3);
  adat(1,2) = mat(1,2)-mat(2,1); 
  adat(1,3) = mat(1,3)-mat(3,1); 
  adat(2,3) = mat(2,3)-mat(3,2);

  fac = phi/(2*sin(phi));
  adat(1,2) = fac*adat(1,2); adat(1,3) = fac*adat(1,3); adat(2,3) = fac*adat(2,3);
  adat(2,1) = -adat(1,2); adat(3,1) = -adat(1,3); adat(3,2) = -adat(2,3);
else,
  adat = expm(mat);
end;
setdata(v,adat);
return;
