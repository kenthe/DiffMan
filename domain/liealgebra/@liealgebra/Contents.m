% SPECIFICATION OF: LieAlgebra
% ----------------
% 
% SUMMARY: class LieAlgebra
% -------
%         Based on:
%         --------
%            external class Vector<F>
%            external class Matrix<F>
%            parameter Field class F; // denotes real or complex numbers.
%
%         Properties:
%         ----------
%            Real or complex vectorspace equipped with a Lie bracket.
% 
% PURPOSE:
% -------
%    The class define the minimal signature required for classes to
%    be called LieAlgebras. LieAlgebras are in our applications important
%    for defining homogeneous spaces.
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
%    A Lie algebra is a real or complex vectorspace equipped with a Lie
%    bracket, which is a function
%       [.,.] : Lalg,Lalg -> Lalg
%    with the following properties:
%    1) Bilinearity.
%       [x+y,z] = [x,z]+[y,z]
%       [r*x,y] = r*[x,y]
%    2) Skew symmetry.
%       [x,y] = -[y,x]
%    3) Jacobi identity
%       [x,[y,z]]+[y,[z,x]]+[z,[x,y]] = 0
% 
%    An important special case is when [x,y] = 0 for all x,y in Lalg.
%    This is called the Abelian or Commutative case.
%    An other imporant case are Matrix Liealgebras, where the elements
%    are matrices and the bracket is given in terms of matrix products:
%       [a,b] = a*b-b*a
%    All finite dimensional algebra has a representation via matrices, but
%    we don't require this representation to be given.
% 
%    Operations:
%    ----------
%    Constructors:
%       function [a] = liealgebra(varargin)
%       Result:
%          No argument:
%             a = liealgebra; % returns liealgebra superclass element.
% 
%          Single argument, argument daughter class element,
%             a = liealgebra(arg); isa(arg,'laxxx') == 1;
%          This sets a to have the same liealgebra as arg, but the data
%          in a is undefined. If arg has shape information, this is copied
%          to a.
% 
%          Multiple arguments, first argument daughter class element,
%             a = liealgebra(b,arg2,arg3,...); isa(b,'laxxx') == 1;
%          same as calling daughter class constructor:
%             a = laxxx(b,arg2,arg3,...);
% 
%    Observers:
%       dimension : Lalg -> int
%       function [d] = dimension(g)
%          Result: returns the dimension of the vectorspace underlying Lalg
% 
%       getVector    : Lalg -> vec
%       function [v] = getvector(g)
%          Result: returns a (column) vector which represents the element g.
%          More precisely: Any Lie algebra is also a vectorspace. This
%             function should be a linear isomorphism between the 
%             vectorspace of the Liealgebra and matlab vector space.
%          Example: We must have: if a and b are elements of a Liealgebra, then
%             dimension(a) == length(getvector(a))
%             getvector(a+b) == getvector(a) + getvector(b)
% 
%       getData      : Lalg -> LalgData
%       function [v] = getdata(g)
%          Result: returns data that represents an element g. The specific
%          form of this data depends on the particular case.
% 
%       isAbelian    : Lalg -> bool
%       function [i] = isabelian(g)
%          Result: checks whether or not an algebra is Abelian.
% 
%       hasMatrix    : Lalg -> bool
%       function [i] = hasmatrix(g)
%          Result: checks whether or not the liealgebra of g has a matrix
%             representation.
%          Remark: This function does not check if a matrix has really
%             been assigned to g.
%          Example:
%             g = lagl;
%             hasmatrix(g); % will return 1 since lagl has a matrix
%                           % representation.
%             getmatrix(g); % returns the empty matrix, [].
% 
%       hasShape    : Lalg -> bool
%       function [i] = hasshape(g)
%          Result: checks whether or not liealgebra of g has dynamic shape
%             information.
%          Remark: This function does not check if a shape has really
%             been assigned to g, see hasMatrix above.
% 
%       isMatrix     : Lalg,mat -> bool
%       function [i] = ismatrix(g,m)
%          Result: checks if m could be matrix representation for data in Lalg.
%             If hasmatrix(g)==0, then ismatrix(g,m) returns 0 always.
%          Example: in laso it would check if m is skew-symmtetric.
% 
%       isData     : Lalg,LalgData -> bool
%       function [i] = isdata(g,m)
%          Result: checks if m could be data for an element in Lalg.
%          Example: in laso(n), the data is nxn matrices, and it would check if
%          m is skew-symmtetric.
% 
%       sameShape     : Lalg,Lalg -> bool
%       function [i] = sameshape(g,h)
%          Result: Checks if g and h belong to the same Liealgebra. If
%          hasshape(g) == hasshape(h) == 0, this function returns 1.
%          If class(g) ~= class(h), the function should always return 0.
% 
%     --- optional ---
%       liegroup   : Lalg -> Lgr
%       function [g] = liegroup(a)
%          Result: finds the Lie group corresponding to the Lie algebra a.
%          More precisely: If a has shape information, then the shape of
%             g is set equivalently.
% 
%       dist : Lalg,Lalg -> real
%       function [d] = dist(g,h)
%          Result: returns some metric distance between two elements in Lalg
%          More precisely: if not overloaded in daughter class, this function
%             returns: d = norm(getvector(g)-getvector(h));
% 
%       getMatrix    : Lalg -> mat
%       function [m] = getmatrix(g)
%          Precondition: hasmatrix(g) == 1
%          Result: Returns matrix representation of element g.
%          More precisely: This function must be a representation of
%             the Liealgebra, so that:
%             getmatrix([a,b]) == getmatrix(a)*getmatrix(b) - ...
%                  getmatrix(b)*getmatrix(a)
% 
%       getShape     : Lalg -> LalgShape
%       function [sh] = getshape(g)
%          Precondition: hasshape(g) == 1;
%          Result: If the class Lalg is dynamically subtyped, this will
%             return all the information about the particular subtype of Lalg
%             to which g belongs.
%          Example: The Lie algebra lagl (general linear liealgebra) consists
%             of all nxn matrices, with matrix commutator as bracket. The
%             subtype is in this case the integer n, which is necessary and
%             sufficient for identifying a particular algebra in the class.
% 
%    Generators:
%       .+. : Lalg,Lalg -> Lalg
%       function [c] = plus(a,b)
%          Result: addition in the algebra
% 
%       .-. : Lalg,Lalg -> Lalg
%       function [c] = minus(a,b)
%          Result: subtraction in the algebra
% 
%       -. : Lalg -> Lalg
%       function [c] = uminus(a)
%          Result: unary minus
% 
%       .*. : Lalg,F -> Lalg,    .*. : F,Lalg -> Lalg
%       function [c] = mtimes(a,b)
%          Result: scalar multiplication
% 
%       0 :  Lalg -> Lalg
%       function [z] = zero(g)
%          Result: returns the zero element in the algebra defined by g.
% 
%       [.,.]  :  Lalg,Lalg -> Lalg
%       function [c] = horzcat(a,b)
%          Result: Lie bracket.
% 
%       zeros : Lalg,N -> Lalg^N
%       function [oarray] = zeros(obj,sz)	
% 	   Result: Returns an object vector of length 'sz' that
%                  contains the zero object in all entries. 
% 
%       setVector    : Lalg,vec -> Lalg
%       function [] = setvector(upd g,v)
%          Result: sets v to be the vector data of g.
%             This function should be the inverse of getvector.
% 
%       setData      : Lalg,LalgData -> Lalg
%       function [] = setdata(g,d)
%          Result: sets data that represents an element g. The specific
%          form of this data depends on the particular case.
% 
%       basis : Lalg,int -> Lalg
%       function [b] = basis(a,i)
%          Precondition: 0<i<=dimension(a)
%          Result: Returns the i'th basis vector in the algebra.
%          More precisely: basis should work according to setvector, such
%          that basis(a,i) == setvector(a,[0 0 0 .. 1 .. 0 0 0]')
%          where the 1 is in i'th position.
% 
%     --- optional ---
%       dcay : Lalg,Lalg,int -> Lalg
%       function [d] = dcay(a,b,n)
%          Result: The differential of the Cayley coordinate
%                  (coordinates of the first kind) mapping.
%          Note: Cayley coordinates are only valid for some matrix Lie
%                groups: SO(n), O(n) & Sp(2n). See Note of dexp. 
%
%       dcaycay : Lalg,Lalg,int -> Lalg
%       function [d] = dcaycay(a,b,n)
%          Result: The differential of the Cayley coordinates of the second
%                  kind, i.e. coordinates consisting of products of
%                  Cayley transforms. 
%          Note: See Note of dcay & dexp. 
% 
%       dexp : Lalg,Lalg,int -> Lalg
%       function [d] = dexp(a,b,n)
%          Result: The differential of the exponential coordinate
%                  mapping (Canonical coordinates of the first kind)
%                  approximated to order n. 
%          Note: We assume that the tangentspace TG is trivialized by
%                right multiplication, and hence dexp is a mapping from
%                the Lie algebra to itself. 
%          More precisely: In the case of matrix Lie algebras, we have:
%                          exp'(a,b) = dexp(a,b)*exp(a)
% 
%       dexpexp : Lalg,Lalg,int -> Lalg
%       function [d] = dexpexp(a,b,n)
%          Result: The differential of Canonical coordinate of the
%                   second kind. 
%          Note: See Note of dexp. 
%
%       dpade22 : Lalg,Lalg,int -> Lalg
%       function [d] = dpade22(a,b,n)
%          Result: The differential of the (2,2) diagonal Pade' 
%                  coordinate of the first kind. 
%          Note: See Note of dcay. 
%
%       dcayinv : Lalg,Lalg,int -> Lalg
%       function [d] = dcayinv(a,b,n)
%          Result: The inverse of the differential of Cayley
%                  coordinates of the first kind. 
%          More precisely:
%             b == dcayinv(a,dcay(a,b));
%             c == dcay(a,dcayinv(a,c));
%
%       dcaycayinv : Lalg,Lalg,int -> Lalg
%       function [d] = dcaycayinv(a,b,n)
%          Result: The inverse of the differential of Cayley
%                  coordinates of the second kind. 
%          More precisely:
%             b == dcaycayinv(a,dcaycay(a,b));
%             c == dcaycay(a,dcaycayinv(a,c));
%
%       dexpinv : Lalg,Lalg,int -> Lalg
%       function [d] = dexpinv(a,b,n)
%          Result: The inverse differential of the exponential mapping,
%             approximated to order n.
%          Note: We assume that the tangentspace TG is trivialized by
%             right multiplication, and hence dexpinv is a mapping from
%             the Lie algebra to itself.
%          More precisely:
%             b == dexpinv(a,dexp(a,b));
%             c == dexp(a,dexpinv(a,c));
%
%       dexpexpinv : Lalg,Lalg,int -> Lalg
%       function [d] = dexpexpinv(a,b,n)
%          Result: The inverse of the differential of Canonical               
%                  coordinates of the second kind. 
%          More precisely:
%             b == dexpexpinv(a,dexpexp(a,b));
%             c == dexpexp(a,dexpexpinv(a,c));
%
%       dpade22inv : Lalg,Lalg,int -> Lalg
%       function [d] = dpade22inv(a,b,n)
%          Result: The inverse of the differential of the (2,2) 
%                  diagonal Pade' coordinate of the first kind. 
%          More precisely:
%             b == dpade22inv(a,dpade22(a,b));
%             c == dpade22(a,dpade22inv(a,c));
% 
%       setMatrix    : Lalg,mat -> Lalg
%       function [] = setmatrix(upd g,m)
%          Precondition: ismatrix(g,m) == 1
%          Result: sets m to be the matrix data of g
%             This function should be the inverse of getmatrix.
% 
%       project    : Lalg,LalgData -> LalgData
%       function [n] = project(g,m)
%          Result: Returns a dataset n which is 'near' m, and acceptable by g.
%          More precisely: isdata(g,n)==1;
%                          if isdata(g,m)==1, then n==m.
%          Example: In 'laso(n)', LalgData is nxn matrices. In this case,
%             the projection takes in an arbitrary matrix, and returns a
%             skew-symmetric matrix by simple skew-symmetrization.
% 
%       setShape     : Lalg,LlgShape -> Lalg
%       function [] = setshape(upd g,sh)
%          Result: sets shape information in g.
% 
%       eig : Lalg -> F^LalgShape
%       function [e] = eig(a)
%          Result: Returns the eigenvalues for matrix algebra elements.
%          Note: This function requires that the algebra has a matrix
%                representation. Calls the builtin 'eig' function in MATLAB.
%
%       norm : Lalg,String -> F
%       function [e] = norm(a,alt)
%          Result: Returns the norm of algebra element.
%          Note: Calls the builtin 'norm' function in MATLAB, and
%                options can be given through second argument.
%
%       random : Lalg -> Lalg
%       function [h] = random(g)
%          Result: returns a random element in the algebra defined by g.
% 
%       display : Lalg -> Screen
%       function [] = display(g)
% 	 Result: display the Lie algebra element g. If g contains
% 	 	 shape and data this information is also displayed.
% 
%    Conventions:
%       See diffmanstandard.doc

% WRITTEN   BY: Hans Munthe-Kaas, 22/8-97
% REVISED   BY: Kenth Engø, 1999.03.05
% VALIDATED BY:
% ACCEPTED  BY:
