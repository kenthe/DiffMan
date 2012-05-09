function [c] = ladpmtimes(a,const)
% LADPMTIMES - Mtimes 'ladirprod'-objects. 
% function [c] = ladpmtimes(a,const)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

if iscell(a),
  n = size(a,1);
  c = cell(n,1); 
  for i = 1:n,
    c{i} = ladpmtimes(a{i},const);
  end;
else
  c = a*const;
end;
return;
