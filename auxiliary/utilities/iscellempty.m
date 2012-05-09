function [bool] = iscellempty(c)
% ISCELLEMPTY - Checks if a cell array consists of only empty matrices.

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : None

global DMARGCHK

if DMARGCHK,
  if (nargin ~= 1)|(nargout > 1),
    error('Wrong number of input/output arguments!');
  end;
  if ~iscell(c),
    error('Input is not a cell array.');
  end;
end;

bool = 1;
n = prod(size(c));
for i = 1:n,
  if iscell(c{i}),
    bool = bool*iscellempty(c{i});
  else,
    bool = bool*isempty(c{i});
  end;
  if bool == 0,
    return;
  end;
end;
return;
