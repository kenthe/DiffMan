% SPECIFICATION OF: LADirProd
% ----------------
% 
% SUMMARY: LieAlgebra class LADirProd
% -------
% 	Based on:
% 	--------
%          class LieAlgebra
%
% 	Properties: 
% 	----------
% 	   Direct product of Lie algebras.
% 	  
% PURPOSE:
% -------
%    This class defines direct products of Lie algebras.
% 
% DESCRIPTION:
% -----------
%    Types:
%    -----
%       vec  = Vector<F>
%       mat  = Matrix<F>
%       Lalg = LieAlgebra;
%       F    = real or complex numbers
%       Lgr  = LieGroup; // corresponding to Lalg
%    
%    Definitions:
%    -----------
%       The direct product of two Lie algebras LA1 and LA2 is denoted by
%       LA1 x LA2. The operations on the individual Lie algebras carry
%       directly over to the direct product Lie algebra. Hence, e.g. the
%       exponential map is given as: 
%          exp: LA1 x LA2 -> LG1 x LG2; (g1,g2) -> (exp1(g1),exp2(g2)),
%       and the commutator is given as:
%          [,]: (LA1 x LA2) x (LA1 x LA2) -> (LA1 x LA2);
%       i.e.;  [(a1,a2),(b1,b2)] = ([a1,b1],[a2,b2]).
%
%       The direct product Lie algebra is dynamically subtyped by the
%       Lie algebras constituting the product.
%    
%    MATLAB representation:
%    ---------------------
%       A direct product Lie algebra object 'dalg' is represented in MATLAB
%       by the following struct:
%
%               dalg -          : Lalg
%               dalg.n          : Integer - the order of the direct product.
%               dalg.shape      : MATLAB (dalg.n,2)-cell array.
%               dalg.data       : MATLAB (dalg.n,1)-cell vector.
%
%       Example:    
%       >> a = ladirprod(random(laso(3)),random(larn(4)))
%       a =
%       Class: ladirprod
%       Shape: laso(3) x larn(4)
%       (1): Data of laso(3)-object:
%                  ...
%       (2): Data of larn(4)-object:
%                  ...               
%
%           In the object 'a' shape information is stored in the 2x2 cell 
%           array as follows:
%
%                  a.shape = { {'laso'}, {3} ; {'larn'}, {4} };
%
%           If the la-object does not have a shape, the second cell in a row
%           is left empty.
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = ladirprod(varargin)
%       Result:
%          No argument:
%             a = ladirprod; % Returns ladirprod template object.
%                            % Object contains no data and no shape.
%          
%          Single argument of same class. 'Copy' constructor, where data 
%          is discarded.    
%             a = ladirprod(b); isa(b,'ladirprod') == 1;
% 
% 	   Two _or_ more Lie algebra objects. Constructing a direct product
%          object of all argument Lie algebras.
%             a = ladirprod(la_1,la_2,...,la_n); 
% 		isa(la_i,'liealgebra') == 1, (i = 1,2,..,n)
%             If the argument Lie algebra has shape information, this is 
%             required to be pre-set:
%               if hasshape(la_i) => ~isempty(getshape(la_i)), (i=1,2,..,n).
%
%          Two arguments; isa(arg1,'liealgebra') & dmisinteger(arg2), constructs
%          an arg2-fold direct product of the Lie algebra in arg1.
%             a = ladirprod(lalgobj,int);
%
%          Other types of input: 
%             Illegal input.
%
%    Observers:
%        For information about the observers, see the generic Lie
%        algebra '@liealgebra'.
%             
%    Generators:
%        For information about the generators, see the generic Lie
%        algebra '@liealgebra'.
%             
%    Conventions:
%       See diffmanstandard.doc
      
% WRITTEN   BY: Kenth Engø, 1997 Sept.
% MODIFIED  BY: Kenth Engø-Monsen, 2012.04.24
% VALIDATED BY:
% ACCEPTED  BY:
   
