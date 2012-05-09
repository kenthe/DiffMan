% SPECIFICATION OF: LGTangent
% ----------------
% 
% SUMMARY: LieGroup class LGTangent
% -------
% 	Based on:
% 	--------
%          class LieGroup
%
% 	Properties: 
% 	----------
% 	   Tangent manifold of Lie groups.
% 	  
% PURPOSE:
% -------
%    This class defines tangent manifolds of Lie groups.
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
%       The tangent manifold TG of a Lie group G is represented in
%       trivialized form as a semidirect product on Gxg.
%
%       The tangent manifold of a Lie group is dynamically subtyped 
%       by the base Lie group. TG is a vector bundle over G.
%    
%    MATLAB representation:
%    ---------------------
%       A tangent manifold object 'tg' is represented in MATLAB
%       by the following struct:
%
%               tg -          : Lgr
%               tg.shape      : MATLAB 2x1-cell vector 
%                               <=> {clsname-string, shapeinfo}.
%               tg.data       : MATLAB 2x1-cell vector
%                               <=> {lg-data, la-data}.
%
%       Example:    
%       >> a = random(lgtangent(lgso(3)))
%       a =
%       Class: lgtangent
%       Shape: lgso(3)
%       (1): Random data for lgso(3)-object:
%                  ...
%       (2): Random data for laso(3)-object:
%                  ...               
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = lgtangent(varargin)
%       Result:
%          No argument:
%             a = lgtangent; % Returns lgtangent template object.
%                            % Object contains no data and no shape.
%          
% 	   Single Lie group object as argument, which includes lgtangent, 
%          lgsemprod, and lgdirprod objects. Constructs an object 
%          in the tangent manifold of the Lie group.
%             a = lgtangent(lg); isa(lg,'liegroup') == 1;
%             If the Lie group object has shape-information, this is 
%             required to be pre-set:
%               if hasshape(lg) => ~isempty(getshape(lg));
%
%          Two arguments; isa(arg1,'liegroup') & dmisinteger(arg2), constructs
%          the arg2'th order tangent manifold of the Lie group arg1.
%             a = lgtangent(lgrpobj,int);
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
      
% WRITTEN   BY: Kenth Engø, 2000 Mar.
% MODIFIED  BY: Kenth Engø-Monsen, 2012.04.24 
% VALIDATED BY:
% ACCEPTED  BY:
   
