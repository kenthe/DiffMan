function setcommtab(f)
% SETCOMMTAB - Diffman: LIEALGEBRA class LARFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1998.11.05
% LAST MODIFIED BY : None.

if ~isempty(f.commtab),
	return;
end;
f.commtab = getcommtab(f);
name = inputname(1);
if isempty(name), % not called by named object
	error('Argument must be a named variable.');
	return; 
end
% Finally, assign f in caller's workspace
assignin('caller',name,f);
return;
