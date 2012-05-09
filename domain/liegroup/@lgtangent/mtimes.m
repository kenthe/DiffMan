%-*-text-*-
function [w] = mtimes(u,v)
% MTIMES - Group multiplication in LGTANGENT.
% function [w] = mtimes(u,v)

% WRITTEN BY       : Kenth Engø, 2000 Mar.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if ~sameshape(u,v)
    error('Input objects do not have the same shape');
  end;
end;

w = identity(u);
if iscellempty(u.shape)|iscellempty(v.shape), return; end;

w.data = lgtmtimes(u.data,v.data,u.shape);
return;
