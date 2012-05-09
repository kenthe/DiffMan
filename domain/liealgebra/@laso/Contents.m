% SPECIFICATION OF: liealgebra class laso
% ----------------
% 
% SUMMARY: liealgebra class laso
% -------
% 	Based on:
% 	--------
% 	   class liealgebra
% 	Properties: 
% 	----------
% 	   Lie algebra mathematically: so(n).
% 	  
% PURPOSE:
% -------
%    Defines the Lie algebra so(n), consisting of 
%    all real skew-symmetric nxn matrices.  
% 
% DESCRIPTION:
% -----------
%    Types:
%    -----
%       Lalg = LieAlgebra;
%       Lgr  = LieGroup; // corresponding to Lalg
%       F = real or complex numbers
%       vec = Vector<F>
%       mat = Matrix<F>
%    
%    Definitions:
%    -----------
%       The Lie algebra so(n), consists of all real skew-symmetric nxn
%       matrices. The class is dynamically subtyped, with the positive
%       integer n as the shape information.
%       
%    Operations:
%    ----------
%    See parent class 'liealgebra' for more info. 
%    
%    Constructor:
% US    function [a] = laso(varargin)
%       Result:
%          No argument:
%             a = laso; % returns element with no data and no shape.
%          
%          Single argument of class laso: copy constructor
%             a = laso(b); isa(b,'laso') == 1;
%          
%    Observers:
% G     dimension : Lalg->int
%       function [d] = dimension(g)
%          Result: Returns the dimension of so(n): n*(n-1)/2.
%          
% US    getVector    : Lalg->vec
%       function [v] = getvector(g)
%          Result: Returns a [n*(n-1)/2,1] vector using the inverse hat
% 		 map ^: R^n -> so(n) on g.
%          
% US    isAbelian    : Lalg->bool
%       function [i] = isabelian(g)
%          Result: Returns 0.
%          
% US    hasMatrix    : Lalg->bool
%       function [i] = hasmatrix(g)
%          Result: Checks whether or not g has a matrix representation.
%          
% US    hasShape    : Lalg->bool
%       function [i] = hasshape(g)
%          Result: Checks whether or not g has dynamic shape information.
%          
% US    isMatrix     : Lalg,mat->bool
%       function [i] = ismatrix(g,m)
%          Result: Checks if m is skew-symmetric.
%          
% G     dist : Lalg,Lalg->real
%       function [d] = dist(g,h)
%          Result: Returns some metric distance between two elements in Lalg
%          More precisely: if not overloaded in daughter class, this function
%             returns: d = norm(getvector(g)-getvector(h));
%             
% G     sameShape     : Lalg,Lalg->bool
%       function [i] = sameshape(g,h)
%          Result: Checks if g and h belong to the same Liealgebra. If 
%          hasshape(g) == hasshape(h) == 0, this function returns 1.
%          If class(g) ~= class(h), the function should always return 0.
%          
% G     liegroup   : Lalg->Lgr
%       function [g] = liegroup(a)
%          Result: Finds the Lie group corresponding to the Lie algebra a.
%          More precisely: If a has shape information, then the shape of
%             g is set equivalently.
%          
%     --- optional ---
% US    getMatrix    : Lalg->mat
%       function [m] = getmatrix(g)
% ?        Precondition: ismatrix__alg__(g) == 1
%          Result: Returns matrix representation of element g.
%          
% US    getShape     : Lalg->LieAlgShape
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
% G     .+. : Lalg,Lalg->Lalg
%       function [c] = plus(a,b)
%          Result: addition in the algebra
%          
%       .-. : Lalg,Lalg->Lalg
% G     function [c] = minus(a,b)
%          Result: subtraction in the algebra
%          
%       -. : Lalg->Lalg
% G     function [c] = uminus(a)
%          Result: unary minus
%          
%       .*. : Lalg,F->Lalg,    .*. : F,Lalg->Lalg
% G     function [c] = mtimes(a,b)
%          Result: scalar multiplication
%          
%       0 :  Lalg->Lalg
% G     function [z] = zero(g)
%          Result: returns the zero element in the algebra defined by g.   
%          
%       [.,.]  :  Lalg,Lalg->Lalg
% G     function [c] = horzcat(a,b)
%          Result: Lie bracket.
%          
% US    setVector    : Lalg,vec->Lalg
%       function [] = setvector(upd g,v)
%          Result: Sets v to be the vector data of g.
%          
%     --- optional ---
% US    setMatrix    : Lalg,mat->Lalg
%       function [] = setmatrix(upd g,m)
%          Precondition: ismatrix(g,m) == 1
%          Result: Sets m to be the matrix data of g
%          
%       project    : Lalg,mat->mat
% US    function [n] = project(g,m)
%          Result: Returns a matrix n which is 'near' m, and acceptable by g.
%          More precisely: ismatrix(g,n)==1;
%                          if ismatrix(g,m)==1, then n==m.
%          
%       setShape     : Lalg,LieAlgShape->Lalg
% US    function [] = setshape(upd g,sh)
%          Result: Sets shape information in g.
%          
%       random : Lalg->Lalg
% G     function [h] = random(g)
%          Result: Returns a random element in the algebra defined by g.
%             
%    Conventions:
%       See diffmanstandard.doc
      
% Written   by: Kenth Engø, 1997.09.09
% Validated by:
% Accepted  by:
   
