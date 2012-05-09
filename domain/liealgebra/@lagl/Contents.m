% SPECIFICATION OF: liealgebra class lagl
% ----------------
% 
% SUMMARY: liealgebra class lagl
% -------
% 	Based on:
% 	--------
% 	   class liealgebra
% 	Properties: 
% 	----------
% 	   Lie algebra mathematically: gl(n).
% 	  
% PURPOSE:
% -------
%    Defines the Lie algebra gl(n), consisting of all real nxn matrices.
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
%       The Lie algebra gl(n), consists of all real nxn matrices. The class 
%       is dynamically subtyped, with the positive integer n as the shape 
%       information.
%       
%    Operations:
%    ----------
%    See parent class 'liealgebra' for more info. 
%    
%    Constructors:
%       function [a] = lagl(varargin)
%       Result:
%          No argument:
%             a = lagl; % returns element with no data and no shape.
%          
%          Single argument of same class: copy constructor
%             a = liealgebra(b); isa(b,'lagl') == 1;
%          
%    Observers:
%       dimension : Lalg->int
%       function [d] = dimension(g)
%          Result: The dimension of gl(n) is n*n.
%          
%       getVector    : Lalg->vec
%       function [v] = getvector(g)
%          Result: returns a [n*n,1] vector taken columnwise from the 
%             matrix of g.
%          
%       isAbelian    : Lalg->bool
%       function [i] = isabelian(g)
%          Result: Returns 0.
%          
%       hasMatrix    : Lalg->bool
%       function [i] = hasmatrix(g)
%          Result: checks whether or not g has a matrix representation
%          
%       hasShape    : Lalg->bool
%       function [i] = hasshape(g)
%          Result: checks whether or not g has dynamic shape information
%          
%       isMatrix     : Lalg,mat->bool
%       function [i] = ismatrix(g,m)
%          Result: checks if m could be matrix representation for data in Lalg.
%             If hasmatrix(g)==0, then ismatrix(g,m) returns 0 always.
%          Example: in laso it would check if m is skew-symmtetric.
%          
%       dist : Lalg,Lalg->real
%       function [d] = dist(g,h)
%          Result: returns some metric distance between two elements in Lalg
%          More precisely: if not overloaded in daughter class, this function
%             returns: d = norm(getvector(g)-getvector(h));
%             
%       sameShape     : Lalg,Lalg->bool
%       function [i] = sameshape(g,h)
%          Result: Checks if g and h belong to the same Liealgebra. If 
%          hasshape(g) == hasshape(h) == 0, this function returns 1.
%          If class(g) ~= class(h), the function should always return 0.
%          
%       liegroup   : Lalg->Lgr
%       function [g] = liegroup(a)
%          Result: finds the Lie group corresponding to the Lie algebra a.
%          More precisely: If a has shape information, then the shape of
%             g is set equivalently.
%          
%     --- optional ---
%       getMatrix    : Lalg->mat
%       function [m] = getmatrix(g)
%          Precondition: ismatrixalg(g) == 1
%          Result: Returns matrix representation of element g.
%          
%       getShape     : Lalg->LieAlgShape
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
%       .+. : Lalg,Lalg->Lalg
%       function [c] = plus(a,b)
%          Result: addition in the algebra
%          
%       .-. : Lalg,Lalg->Lalg
%       function [c] = minus(a,b)
%          Result: subtraction in the algebra
%          
%       -. : Lalg->Lalg
%       function [c] = uminus(a)
%          Result: unary minus
%          
%       .*. : Lalg,F->Lalg,    .*. : F,Lalg->Lalg
%       function [c] = mtimes(a,b)
%          Result: scalar multiplication
%          
%       0 :  Lalg->Lalg
%       function [z] = zero(g)
%          Result: returns the zero element in the algebra defined by g.   
%          
%       [.,.]  :  Lalg,Lalg->Lalg
%       function [c] = horzcat(a,b)
%          Result: Lie bracket.
%          
%       setVector    : Lalg,vec->Lalg
%       function [] = setvector(upd g,v)
%          Result: sets v to be the vector data of g
%          
%     --- optional ---
%       setMatrix    : Lalg,mat->Lalg
%       function [] = setmatrix(upd g,m)
%          Precondition: ismatrix(g,m) == 1
%          Result: sets m to be the matrix data of g
%          
%       project    : Lalg,mat->mat
%       function [n] = project(g,m)
%          Result: returns a matrix n which is 'near' m, and acceptable by g.
%          More precisely: ismatrix(g,n)==1;
%                          if ismatrix(g,m)==1, then n==m.
%          
%       setShape     : Lalg,LieAlgShape->Lalg
%       function [] = setshape(upd g,sh)
%          Result: sets shape information in g.
%          
%       random : Lalg->Lalg
%       function [h] = random(g)
%          Result: returns a random element in the algebra defined by g.
%             
%    Conventions:
%       See diffmanstandard.doc
      
% Written   by: Hans Munthe-Kaas, 22/8-97
% Validated by:
% Accepted  by:
   
