% SPECIFICATION OF: LieGroup
% ----------------
% 
% SUMMARY: class LieGroup
% -------
% 	Based on:
% 	--------
% 	   external class Vector<F>
% 	   external class Matrix<F>
% 	   parameter Field class F; // denotes real or complex numbers.
%
% 	Properties: 
% 	----------
% 	   Continuous group.
% 	  
% PURPOSE:
% -------
%    A Lie group G is a manifold equipped with a product 
%       .*. : G,G -> G
%    which satisfy the axioms of a group. The product must be a continuous 
%    mapping.
% 
% DESCRIPTION: 
% -----------
%    Types: 
%    -----
%       Lalg   = LieAlgebra;
%       Lgr    = LieGroup; // corresponding to Lalg
%       F      = real or complex numbers
%       vec    = Vector<F>
%       mat    = Matrix<F>
%       LalgShape : type of shape information for a particular Lalg, undefined
%       LalgData  : type of element data for a particular Lalg, undefined
%    
%    Definitions:
%    -----------
%       A group is a set G with a product rule .*. : GxG -> G, such that:
%          1) assiciativity: a*(b*c) = (a*b)*c.
%          2) there exist an identity: e*a = a*e for all a in G.
%          3) there exist an inverse: a*inv(a) = e for all a in G.
%       A Lie group, is a group which is also a manifold, and such that
%       the product
%          .*. : G,G -> G
%       and the inverse
%          inv(.) : G -> G
%       are continuous, smooth mappings between manifolds.
%       
%       The group is abelian if: a*b = b*a for all a,b in G.
%    
%    Operations:
%    ----------
%    Constructors:
%       function [a] = liegroup(varargin)
%       Result:
%          No argument:
%             a = liegroup; % returns liegroup superclass element.
%             
%          Single argument, argument daughter class element, 
%             a = liegroup(arg); isa(arg,'lgxxx') == 1;
%          This sets a to have the same liegroup as arg, but the data
%          in a is undefined. If arg has shape information, this is copied
%          to a.
%          
%          Multiple arguments, first argument daughter class element,
%             a = liegroup(b,arg2,arg3,...); isa(b,'lgxxx') == 1;
%          same as calling daughter class constructor:
%             a = lgxxx(b,arg2,arg3,...);
%                   
%    Observers: 
%       isAbelian    : Lgr -> bool
%       function [i] = isabelian(g)
%          Result: checks whether or not a Liegroup is Abelian.
%          
%       hasMatrix    : Lgr -> bool
%       function [i] = hasmatrix(g)
%          Result: checks whether or not the liegroup of g has a matrix 
%             representation.
%          Remark: This function does not check if a matrix has really
%             been assigned to g.
%          Example:
%             g = lggl;
%             hasmatrix(g); % will return 1 since lggl has a matrix 
%                           % representation.
%             getmatrix(g); % returns the empty matrix, [].
%          
%       hasShape    : Lgr -> bool
%       function [i] = hasshape(g)
%          Result: checks whether or not liegroup of g has dynamic shape 
%             information.
%          Remark: This function does not check if a shape has really
%             been assigned to g, see hasMatrix above.
%          
%       isMatrix     : Lgr,mat -> bool
%       function [i] = ismatrix(g,m)
%          Result: checks if m could be matrix representation for data in Lgr.
%             If hasmatrix(g)==0, then ismatrix(g,m) returns 0 always.
%          Example: in lgso it would check if m is orthogonal.
%          
%       isData     : Lgr,LgrData -> bool
%       function [i] = isdata(g,m)
%          Result: checks if m could be data for an element in Lgr.
%          Example: in lgso(n), the data is nxn matrices, and it would check if 
%          m is orthogonal.
%                   
%       sameShape     : Lgr,Lgr -> bool
%       function [i] = sameshape(g,h)
%          Result: Checks if g and h belong to the same Liegroup. If 
%          hasshape(g) == hasshape(h) == 0, this function returns 1.
%          If class(g) ~= class(h), the function should always return 0.
%          
%       liealgebra   : Lgr -> Lalg
%       function [a] = liealgebra(g)
%          Result: finds the Lie algebra corresponding to the Lie group a.
%          More precisely: If g has shape information, then the shape of
%             a is set equivalently.
%          
%       getData     : Lgr -> LieGrpData
%       function [sh] = getdata(g)
%          Result: Returns the data of the element g. The type of the
%             data depends on the particular group. E.g. in 'lggl' it will
%             return an nxn matrix, while in 'lgrn' it will return an 
%             n-vector.
%       
%     --- optional ---
%       dist : Lgr,Lgr -> real
%       function [d] = dist(g,h)
%          Result: returns some metric distance between two elements in Lgr
%             
%       getMatrix    : Lgr -> mat
%       function [m] = getmatrix(g)
%          Precondition: hasmatrix(g) == 1
%          Result: Returns matrix representation of element g.
%          
%       getShape     : Lgr -> LieGrpShape
%       function [sh] = getshape(g)
%          Precondition: hasshape(g) == 1;
%          Result: If the class Lgr is dynamically subtyped, this will
%             return all the information about the particular subtype of Lgr
%             to which g belongs.
%          Example: The Lie group lggl (general linear liegroup) consists
%             of all nxn matrices, with matrix product as product. The
%             subtype is in this case the integer n, which is necessary and
%             sufficient for identifying a particular group in the class.
%       
%    Generators:
%       identity : Lgr -> Lgr
%       function [e] = identity(a)
%          Result: Sets e to be the identity element in the group defined by a.
% 
%       .*. : Lgr,Lgr -> Lgr
%       function [c] = mtimes(a,b)
%          Precondition: sameshape(a,b);
%          Result: Sets c to be the product c = a*b, in the group.
% 
%       inv : Lgr,Lgr -> Lgr
%       function [ainv] = inv(a)
%          Result: Sets ainv to be the inverse of a in the group.
%
%       cay : Lgr,Lalg -> Lgr
%       function [b] = cay(g,a)
%          Result: Computes the Cayley coordinates of the first kind. 
%             The argument g is only needed to know in which Liegroup 
%             the result should be computed.
%          Remark: The Cayley coordinates only exist for some matrix 
%                  Lie groups; i.e. SO(n), O(n) & Sp(2n).
%          
%       caycay : Lgr,Lalg -> Lgr
%       function [b] = caycay(g,a)
%          Result: Computes the Cayley coordinates of the second kind,
%             i.e. products of Cayley transforms. The argument g is only
%             needed to know in which Liegroup the result should be computed.
%          Remark: See Remark for cay.
%          
%       exp : Lgr,Lalg -> Lgr
%       function [b] = exp(g,a)
%          Result: Computes the exponential mapping - Canonical
%             coordinates of the first kind. The argument g is
%             only needed to know in which Liegroup the result should be 
%             computed.
%          Remark: The exp mapping is put in the Lie group, and not in the
%             Lie algebra, since two different Lie groups may have the same
%             Lie algebras, while the Lie algebra of a Lie group is uniquely
%             defined.
% 
%       expexp : Lgr,Lalg -> Lgr
%       function [b] = expexp(g,a)
%          Result: Computes the Canonical coordinates of the second kind,
%             i.e. products of exponential maps. The argument g is only
%             needed to know in which Liegroup the result should be computed.
%          Remark: See Remark for exp.
%
%       pade22 : Lgr,Lalg -> Lgr
%       function [b] = pade22(g,a)
%          Result: Computes the (2,2) diagonal Pade' coordinates of the
%             first kind. The argument g is only needed to know in which
%             Liegroup the result should be computed.
%          Remark: See Remark for cay, which is also valid for pade22.
%
%       invcay : Lgr -> Lalg
%       function [a] = invcay(g)
%          Result: Computes the inverse Cayley coord. of 1 kind.
%          Remark: See Remark for cay.
%
%       invcaycay : Lgr -> Lalg
%       function [a] = invcaycay(g)
%          Result: Computes the inverse Cayley coord. of 2 kind.
%          Remark: See Remark for cay.
% 
%       log : Lgr -> Lalg
%       function [a] = log(g)
%          Result: Computes the logarithm mapping. (Inverse exponential 
%          mapping).
%
%       invexpexp : Lgr -> Lalg
%       function [a] = invexpexp(g)
%          Result: Computes the inverse Canonical coord. of 2 kind.
% 
%       invpade22 : Lgr -> Lalg
%       function [a] = invpade22(g)
%          Result: Computes the inverse (2,2) diagonal Pade coordinates
%                  of the first kind.
%          Remark: See Remark for cay.
%
%       setData     : Lgr,LgrData -> Lgr
%       function [] = setdata(g,d)
%          Result: Sets the data of the element g. The type of the
%             data depends on the particular group. E.g. in 'lggl' it should
%             be an nxn matrix, while in 'lgrn' it should be an 
%             n-vector.
% 
%     --- optional ---
%     
%       setMatrix    : Lgr,mat -> Lgr
%       function [] = setmatrix(upd g,m)
%          Precondition: ismatrix(g,m) == 1
%          Result: sets m to be the matrix data of g
%          
%       project    : Lgr,LgrData -> LgrData
%       function [n] = project(g,m)
%          Result: Returns a dataset n which is 'near' m, and acceptable by g.
%          More precisely: isdata(g,n)==1;
%                          if isdata(g,m)==1, then n==m.
%          Example: In 'lgso(n)', LgrData is nxn matrices. In this case,
%             the projection takes in an arbitrary matrix, and returns an 
%             orthogonal matrix by simple skew-symmetrization.
%          
%       setShape     : Lgr,LgrShape -> Lgr
%       function [] = setshape(upd g,sh)
%          Result: sets shape information in g.
%          
%       eig : Lgrp -> F^LgrpShape
%       function [e] = eig(a)
%          Result: Returns the eigenvalues for matrix group elements.
%          Note: This function requires that the group has a matrix
%                representation. Calls the builtin 'eig' function in MATLAB.
%
%       norm : Lalg,String -> F
%       function [e] = norm(a,alt)
%          Result: Returns the norm of group element.
%          Note: Calls the builtin 'norm' function in MATLAB, and
%                options can be given through second argument.
%
%       random : Lgr -> Lgr
%       function [h] = random(g)
%          Result: returns a random element in the algebra defined by g.
%             
%       display : Lgr -> Screen
%       function [] = display(g)
% 	 Result: display the Lie group element g. If g contains
% 	 	 shape and data this information is also displayed.
%             
%    Conventions:

% Written   by: Hans Munthe-Kaas, 22/8-97
% Revised   by: Kenth Engø, 1999.03.05
% Validated by:
% Accepted  by:
   
