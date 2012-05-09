function [v] = getdata(g)
% GETDATA - Returns the data representation in LADIRPROD.
% function [v] = getdata(g)

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 1999.04.12

v = cell(g.n,1);
if isempty(g.data), return; end;
for i = 1:g.n,
  v{i} = g.data{i};
end;
return;
