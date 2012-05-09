function [type] = geteqntype(f)
% GETEQNTYPE - Returns the type of the equation.
% function [type] = geteqntype(f)

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

if strcmp(lower(f.eqntype),'l')
  type = 'Linear';
else,
  type = 'General';
end;
return;

