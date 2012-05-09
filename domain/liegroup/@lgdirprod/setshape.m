function [] = setshape(a,sh)
% SETSHAPE - Sets shape information in 'a' and sets data to empty.
% function [] = setshape(a,sh)

% WRITTEN BY       : Kenth Engø, 1998.11.16
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

global DMARGCHK

name = inputname(1);
if DMARGCHK,
  if isempty(name),
    error('First argument to set must be a named variable')
  end;
  if isempty(sh),
    error('Cell vector with shape info is empty!');
  end;
end;

if isa(sh{1},'liegroup'), % Assumes shape is input as a cell-vector of 'liegroup'-objects.
  a = lgdirprod(sh{:});
elseif strcmp(sh{1},'lgdirprod'), % Assume that 'sh' info is a correct 'lgdirprod' shape info.
  a.shape = sh;
  a.n     = size(sh{2},1);
else,  % Don't know other ways of setting the shape.
  error('Don''t know how to set shape of object with the supplied information.');
end;

a.data = cell(a.n,1);      % Descards previous data information.
assignin('caller',name,a);
return;
