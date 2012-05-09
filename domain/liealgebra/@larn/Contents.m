% SPECIFICATION OF: liealgebra class larn
% ----------------
% 
% SUMMARY: liealgebra class larn
% -------
% 	Based on:
% 	--------
% 	   class liealgebra
% 	Properties: 
% 	----------
% 	   Lie algebra mathematically: R^n.
% 	  
% PURPOSE:
% -------
%    Defines the Lie algebra R^n, consisting of all real n-vectors.
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
%       The Lie algebra R^n, consists of all real n-vectors. The class 
%       is dynamically subtyped, with the positive integer n as the shape 
%       information.
%       
%    Operations:
%    ----------
%    See parent class 'liealgebra' for more info. 
%    
%    Constructors:
% US    function [a] = larn(varargin)
%       Result:
%          No argument:
%             a = larn; % returns element with no data and no shape.
%          
%          Single argument of same class: copy constructor
%             a = liealgebra(b); isa(b,'larn') == 1;
%          
%    Observers:
% G     dimension : Lalg->int
%       function [d] = dimension(g)
%          Result: The dimension of R^n is n.
%          
% US    getVector    : Lalg->vec
%       function [v] = getvector(g)
%          Result: Returns a [n,1] vector repr. the data of g
%          
% US    isAbelian    : Lalg->bool
%       function [i] = isabelian(g)
%          Result: Returns 1 since R^n is Abelian.
%          
% US    hasMatrix    : Lalg->bool
%       function [i] = hasmatrix(g)
%          Result: Returns 0, because R^n consists of vetors. (?)
%          
% US    hasShape    : Lalg->bool
%       function [i] = hasshape(g)
%          Result: checks whether or not g has dynamic shape information
%          
% US    isMatrix     : Lalg,mat->bool
%       function [i] = ismatrix(g,m)
%          Result: checks if m could be matrix representation for data in Lalg.
%             If hasmatrix(g)==0, then ismatrix(g,m) returns 0 always.
%          Example: in laso it would check if m is skew-symmtetric.
%          
% G     dist : Lalg,Lalg->real
%       function [d] = dist(g,h)
%          Result: returns some metric distance between two elements in Lalg
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
%          Result: finds the Lie group corresponding to the Lie algebra a.
%          More precisely: If a has shape information, then the shape of
%             g is set equivalently.
%          
%     --- optional ---
% US    getMatrix    : Lalg->mat
%       function [m] = getmatrix(g)
%          Precondition: ismatrixalg(g) == 1
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
% G     .-. : Lalg,Lalg->Lalg
%       function [c] = minus(a,b)
%          Result: subtraction in the algebra
%          
% G     -. : Lalg->Lalg
%       function [c] = uminus(a)
%          Result: unary minus
%          
% G     .*. : Lalg,F->Lalg,    .*. : F,Lalg->Lalg
%       function [c] = mtimes(a,b)
%          Result: scalar multiplication
%          
% G     0 :  Lalg->Lalg
%       function [z] = zero(g)
%          Result: returns the zero element in the algebra defined by g.   
%          
% G     [.,.]  :  Lalg,Lalg->Lalg
%       function [c] = horzcat(a,b)
%          Result: Lie bracket.
%          
% US    setVector    : Lalg,vec->Lalg
%       function [] = setvector(upd g,v)
%          Result: sets v to be the vector data of g
%          
%     --- optional ---
% US    setMatrix    : Lalg,mat->Lalg
%       function [] = setmatrix(upd g,m)
%          Precondition: ismatrix(g,m) == 1
%          Result: sets m to be the matrix data of g
%          
% US    project    : Lalg,mat->mat
%       function [n] = project(g,m)
%          Result: returns a matrix n which is 'near' m, and acceptable by g.
%          More precisely: ismatrix(g,n)==1;
%                          if ismatrix(g,m)==1, then n==m.
%          
% US    setShape     : Lalg,LieAlgShape->Lalg
%       function [] = setshape(upd g,sh)
%          Result: sets shape information in g.
%          
% G     random : Lalg->Lalg
%       function [h] = random(g)
%          Result: returns a random element in the algebra defined by g.
%             
%    Conventions:
%       See diffmanstandard.doc
      
% WRITTEN   BY: Kenth Engø, 1997.09.10
% VALIDATED BY:
% ACCEPTED  BY:
   
