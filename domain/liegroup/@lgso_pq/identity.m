function [id] = identity(a)
% IDENTITY - Returns the identity object in LGSO_PQ.
% function [id] = identity(a)

% WRITTEN BY       : Kenth Engø, 1999 Apr.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if isempty(a.shape),
    error('Input object does not have any shape information!');
  end;
end;

id = a;
id.data = eye(sum(a.shape));
return;
