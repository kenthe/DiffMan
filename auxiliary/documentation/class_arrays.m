% Array structures:
% ----------------
% 
% Motivation:
% ----------
% Matlab allows us to create arrays of objects. This is useful in 
% order to create clean and efficient codes. For instance, in RK methods
% one may write:
%   sigma = b(1:s)*Kj(1:s)
% where b is a 1D array of scalars and Kj is a 1D array of Lie algebra elements.
% This type of expressions is significantly faster than a loop, since the 
% overhead of calling an overloaded * operator is significant. Also this 
% expression is significantly cleaner than a loop.
% 
% Problems:
% --------
% The main problem is how to create the array Kj. We could overload all the 
% constructors Matlab uses for creating arrays of reals. It is, however, a 
% problem that the horzcat function: c = [a,b,d]
% is already used for commutators. We do not want to break that convention.
% 
% Solution:
% --------
% We introduce two new constructors: array and cat.
% 
% Hm ... cat already works!!
% 
% Wait till later.