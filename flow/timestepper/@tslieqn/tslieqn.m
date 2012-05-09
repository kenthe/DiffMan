function [obj] = tslieqn(ord)
% TSLIEQN - Constructor for the 'LIEQN' timestepper class.
% function [obj] = tslieqn(ord)
% this is an experimental version. 
% At the moment the constructor takes a single argument, the
% order of the method, and returns a gauss-legendre type method of that
% order for equations of Lie type.
%

% WRITTEN BY       : Hans Munthe-Kaas, 2000.01.27

if (nargin == 0),
   obj.sig = [];
   obj.c = [];
   obj.V = [];
   obj.ord = [];
   obj = class(obj,'tslieqn',timestepper);
  return;
 end;
 
if nargin > 2,
	error('Function called with illegal arguments!');
end;
if rem(ord,2),
	error('Order must be even.');
end;
[sig,c,V] = cmagnus(ord);
setcommtab(sig); % store optimization info
obj.sig = sig;
obj.c = c;
obj.V = V;
obj.ord = ord;
obj = class(obj,'tslieqn',timestepper); 

return;
