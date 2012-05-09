function [v] = getlafdata(a)
% GETLAFDATA - Diffman: LIEALGEBRA class LAFREE private function
%        Get stored data about free Lie algebra

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : None.

% Check if LAFREEDATA is correct before returning a pointer to it

sh = a.shape; 
lafd = a.lafreedata;

if isempty(sh), % a has no shape.
	error('Object has no shape');
	return;
end;

global LAFREEDATA;
if isa(LAFREEDATA,'double'), % in this case it does not exist before
	v = lafreeinit(sh);
	a.lafreedata = v;
	return;
end;

if length(LAFREEDATA) < lafd, % in this case it is wrong
	v = lafreeinit(sh);
	a.lafreedata = v;
	return;
end;

if eqshape(LAFREEDATA(lafd).shape,sh), % in this case it is correct
	v = lafd;
	return;
end;

% in this case it must be recomputed
v = lafreeinit(sh);
a.lafreedata = v;
return;
