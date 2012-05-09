function [c] = horzcat(a,b)
% HORZCAT - Commutator in the Lie algebra LASO.
% function [c] = horzcat(a,b)
%
% REMARK: For the case where the shape equals 3, this routine
%         uses, if 'dmoptimized on', only 9 flops.

% WRITTEN BY       : AM & KE, 1999.04.09
% LAST MODIFIED BY : None

global DMARGCHK DMOPTIMIZE

if DMARGCHK
  if ~(isa(b,'laso') & (a.shape == b.shape)),
    error('Arguments are not of the same Lie algebra!');
  end;
end;

c = a;
if DMOPTIMIZE & (a.shape == 3),
  c.data = zeros(3);
  c.data(1,2)=a.data(2,3)*b.data(1,3)-a.data(1,3)*b.data(2,3);
  c.data(1,3)=a.data(1,2)*b.data(2,3)-a.data(2,3)*b.data(1,2);
  c.data(2,3)=a.data(1,3)*b.data(1,2)-a.data(1,2)*b.data(1,3);
  c.data(2,1)=-c.data(1,2);
  c.data(3,1)=-c.data(1,3);
  c.data(3,2)=-c.data(2,3);
else
  c.data = a.data*b.data - b.data*a.data;
end;
return;

