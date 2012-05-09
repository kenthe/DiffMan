function z = random(a)
% RANDOM - Creates a random object in LGON_PQ.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if isempty(a.shape);
    error('Input object does not have any shape information!');
  end;
end;

z = a;
zdata = getmatrix(exp(a,random(laso_pq(a(1).shape))));
setmatrix(z,zdata);  % Use the setmatrix function in order to CHECK zdata.
return;
