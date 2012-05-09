% SPECIFICATION OF: HManifold
% ----------------
%
% SUMMARY: class HManifold
% -------
% 	Based on:
% 	--------
%            external class Vector<F>
%            external class Matrix<F>
%            parameter Field class F; // denotes real or complex numbers.
%
% 	Properties:
% 	----------
% 	   Homogeneous space - consists of a Lie group acting on a
% 	   manifold by a Lie group action.
%
% PURPOSE:
% -------
%    Homogeneous manifolds are the basic building blocks from which we
%    construct all other manifolds. They are defined in terms of a
%    transitive Lie group action on a manifold.
%
% DESCRIPTION:
% -----------
%    Types:
%    -----
%       Hmf  = Homogeneous Manifold
%       Lalg = Lie Algebra
%       Lgr  = Lie Group    % Corresponding to Lalg
%       Str  = MATLAB string
%       F    = real or complex numbers
%       vec  = Vector<F>
%       mat  = Matrix<F>
%
%    Definitions:
%    -----------
%       % Mathematical definition of the class.
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = hmanifold(varargin)
%       Result:
%          No argument:
%             a = hmanifold; % returns hmanifold superclass element.
%
%          Single argument of same class; Copy constructor.
%             a = hmanifold(arg); isa(arg,'hmanifold') == 1;
%
%          Multiple arguments, first argument daughter class object,
%             a = hmanifold(b,arg2,arg3,...); isa(b,'hmxxx') == 1;
%          same as calling daughter class constructor:
%             a = hmxxx(b,arg2,arg3,...);
%
%    Observers:
%       hasShape    : Hmf -> bool
%       function [i] = hasshape(g)
%          Result: checks whether or not hmanifold of g has dynamic shape
%             information.
%          Remark: This function does not check if a shape has really
%             been assigned to g.
%
%       isData     : Hmf,HmfData -> bool
%       function [i] = isdata(g,m)
%          Result: Checks if m could be data for an element in Hmf.
%          Example: In lgso(n), the data is nxn matrices, and it would
%		    check if m is orthogonal.
%
%       sameShape     : Hmf,Hmf -> bool
%       function [i] = sameshape(g,h)
%          Result: Checks if g and h belong to the same hmanifold. If
%          hasshape(g) == hasshape(h) == 0, this function returns 1.
%          If class(g) ~= class(h), the function should always return 0.
%
%       liealgebra   : Hmf -> Lalg
%       function [a] = liealgebra(g)
%          Result: finds the Lie algebra corresponding to the homogeneous
%             space of g.
%
%       getData     : Hmf -> HmfData
%       function [sh] = getdata(g)
%          Result: Returns the data of the element g. The type of the
%             data depends on the particular group.
%
%     --- optional ---
%       dist : Hmf,Hmf -> Real
%       function [d] = dist(g,h)
%          Result: returns some metric distance between two elements in Hmf.
%
%       getShape     : Hmf -> HmfShape
%       function [sh] = getshape(g)
%          Precondition: hasshape(g) == 1;
%          Result: If the class Hmf is dynamically subtyped, this will
%             return all the information about the particular subtype of Lgr
%             to which g belongs.
%
%       display : Hmf -> Screen
%       function [] = display(g)
%          Result: display the homogeneous space element g. If g contains
%                  shape and data this information is also displayed.
%
%    Generators:
%       origin : Hmf -> Hmf
%       function [e] = origin(a)
%          Result: Sets e to be the origin point in the Hmf defined by a.
%          More precicely: The meaning of origin is defined in the particular
%             Hmf.
%
%       lambda : Lalg,Hmf,Str -> Hmf
%       function [q] = lambda(a,p,str)
%          Result: Computes the algebra action of the Lie algebra object 'a'
%                  on the manifold object 'p'. 'str' is a MATLAB string
%                  naming the type of coordinates used on the Lie group.
%
%       invlambda : Hmf,Hmf -> Lalg
%       function [a] = invlambda(p,q)
%          Result: Inverts lambda in the first argument, when the second is
%                  fixed.
%
%       stabilizer : Hmf -> Matrix
%       function [m] = stabilizer(p)
%          Result: Returns a matrix whose columns spans the stabilizer
%                  subalgebra of the Liealgebra of the Hmf.
%          More precisely: For a given p in Hmf, this is the algebra of all
%                          elements v in g such that lambda(v,p) = p.
%
%       setData : Hmf,HmfData -> Hmf
%       function [] = setdata(g,d)
%          Result: Sets the data of the element g. The type of the
%                  data depends on the particular group.
%
%     --- optional ---
%
%       project    : Hmf,HmfData -> HmfData
%       function [n] = project(g,m)
%          Result: Returns a dataset n which is 'near' m, and acceptable by g.
%          More precisely: isdata(g,n)==1;
%                          if isdata(g,m)==1, then n==m.
%
%       setShape     : Hmf,HmfShape -> Hmf
%       function [] = setshape(upd g,sh)
%          Result: sets shape information in g.
%
%       random : Hmf -> Hmf
%       function [h] = random(g)
%          Result: returns a random element in the algebra defined by g.
%
%    Conventions:
%       See diffmanstandards.doc.

% WRITTEN BY       : Hans Munthe-Kaas, 22/8-97
% LAST MODIFIED BY : Kenth Engø, 1999.03.05
% VALIDATED BY     :
% ACCEPTED  BY     :

