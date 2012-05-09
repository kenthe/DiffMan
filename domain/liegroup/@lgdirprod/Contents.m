% SPECIFICATION OF: LGDirProd
% ----------------
% 
% SUMMARY: LieGroup class LGDirProd
% -------
% 	Based on:
% 	--------
%          class LieGroup
%
% 	Properties: 
% 	----------
% 	   Direct product of Lie groups.
% 	  
% PURPOSE:
% -------
%    This class defines direct products of Lie groups.
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
%       The direct product of two Lie groups LG1 and LG2 is denoted by
%       LG1 x LG2. The operations on the individual Lie groups carry
%       directly over to the direct product Lie group. Hence, e.g. the
%       exponential map is given as: 
%          exp: LA1 x LA2 -> LG1 x LG2; (g1,g2) -> (exp1(g1),exp2(g2)).
%
%       The direct product Lie group is dynamically subtyped by the
%       Lie groups constituting the product.
%    
%    MATLAB representation:
%    ---------------------
%       A direct product Lie group object 'dgrp' is represented in MATLAB
%       by the following struct:
%
%               dgrp -          : Lalg
%               dgrp.n          : Integer - the order of the direct product.
%               dgrp.shape      : MATLAB (dgrp.n,2)-cell array.
%               dgrp.data       : MATLAB (dgrp.n,1)-cell vector.
%
%       Example:    
%       >> a = lgdirprod(random(lgso(3)),random(lgrn(4)))
%       a =
%       Class: lgdirprod
%       Shape: lgso(3) x lgrn(4)
%       (1): Data of lgso(3)-object:
%                  ...
%       (2): Data of lgrn(4)-object:
%                  ...               
%
%           In the object 'a' shape information is stored in the 2x2 cell 
%           array as follows:
%
%                  a.shape = { {'lgso'}, {3} ; {'lgrn'}, {4} };
%
%           If the lg-object does not have a shape, the second cell in a row
%           is left empty.
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = lgdirprod(varargin)
%       Result:
%          No argument:
%             a = lgdirprod; % Returns lgdirprod template object.
%                            % Object contains no data and no shape.
%          
%          Single argument of same class. 'Copy' constructor, where data 
%          is discarded.    
%             a = lgdirprod(b); isa(b,'lgdirprod') == 1;
% 
% 	   Two _or_ more Lie group objects. Constructing a direct product
%          object of all argument Lie groups.
%             a = lgdirprod(lg_1,lg_2,...,lg_n); 
% 		isa(lg_i,'liegroup') == 1, (i = 1,2,..,n)
%             If the argument Lie group has shape information, this is 
%             required to be pre-set:
%               if hasshape(lg_i) => ~isempty(getshape(lg_i)), (i=1,2,..,n).
%
%          Two arguments; isa(arg1,'liegroup') & dmisinteger(arg2), constructs
%          an arg2-fold direct product of the Lie group in arg1.
%             a = lgdirprod(lgrpobj,int);
%
%          Other types of input: 
%             Illegal input.
%
%    Observers:
%        For information about the observers, see the generic Lie
%        group '@liegroup'.
%             
%    Generators:
%        For information about the generators, see the generic Lie
%        group '@liegroup'.
%             
%    Conventions:
%       See diffmanstandard.doc
      
% WRITTEN   BY: Kenth Engø, 1998 Nov.
% MODIFIED  BY: Kenth Engø-Monsen, 2012.04.24 
% VALIDATED BY:
% ACCEPTED  BY:
   
