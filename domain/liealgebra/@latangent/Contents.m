% SPECIFICATION OF: LATangent
% ----------------
% 
% SUMMARY: LieAlgebra class LATangent
% -------
% 	Based on:
% 	--------
%          class LieAlgebra
%
% 	Properties: 
% 	----------
% 	   Tangent manifold of Lie algebras.
% 	  
% PURPOSE:
% -------
%    This class defines tangent manifolds of Lie algebras.
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
%       The tangent manifold Tg of a Lie algebra g is represented 
%       as a semidirect product on gxg.
%
%       The tangent manifold of a Lie algebra is dynamically subtyped 
%       by the base Lie algebra.
%    
%    MATLAB representation:
%    ---------------------
%       A tangent manifold object 'ta' is represented in MATLAB
%       by the following struct:
%
%               ta -          : Lalg
%               ta.shape      : MATLAB 2x1-cell vector 
%                               <=> {clsname-string, shapeinfo}.
%               ta.data       : MATLAB 2x1-cell vector
%                               <=> {la-data, la-data}.
%
%       Example:    
%       >> a = random(latangent(laso(3)))
%       a =
%       Class: latangent
%       Shape: laso(3)
%       (1): Random data for laso(3)-object:
%                  ...
%       (2): Random data for laso(3)-object:
%                  ...               
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = latangent(varargin)
%       Result:
%          No argument:
%             a = latangent; % Returns latangent template object.
%                            % Object contains no data and no shape.
%          
% 	   Single Lie algebra object as argument, which includes latangent, 
%          lasemprod, and ladirprod objects. Constructs an object 
%          in the tangent manifold of the Lie algebra.
%             a = latangent(la); isa(la,'liealgebra') == 1;
%             If the Lie algebra object has shape information, this is 
%             required to be pre-set:
%               if hasshape(la) => ~isempty(getshape(la));
%
%          Two arguments; isa(arg1,'liealgebra') & dmisinteger(arg2), constructs
%          the arg2'th order tangent manifold of the Lie algebra arg1.
%             a = latangent(laobj,int);
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
      
% WRITTEN   BY: Kenth Engø, 2000 Mar.
% MODIFIED  BY: Kenth Engø-Monsen, 2012.04.24 
% VALIDATED BY:
% ACCEPTED  BY:
   
