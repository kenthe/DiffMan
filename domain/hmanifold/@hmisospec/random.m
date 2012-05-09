function z = random(a)
% RANDOM - Creates a random object in the class HMISOSPEC.
% function z = random(a)

% WRITTEN BY       : Kenth Engø, 1998 Nov.
% LAST MODIFIED BY : Kenth Engø, 1999.04.07

if isempty(a.shape), z = hmisospec; return; end; % Generic object.

z = hmisospec(a.shape);
z.data = rand(getshape(a.shape));
return;
