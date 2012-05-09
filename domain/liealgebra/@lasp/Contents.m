% SPECIFICATION OF: LASP
% ----------------
% 
% SUMMARY: LieAlgebra class LASP
% -------
%
% 	Based on:
% 	--------
% 	   class liealgebra
%
% 	Properties: 
% 	----------
% 	   The symplectic Lie algebra: sp(2n,R).
% 	  
% PURPOSE:
% -------
%    Defines the symplectic Lie algebra sp(2n).
%
% DESCRIPTION:
% -----------
%    Types:
%    -----
%       vec = Vector<F>
%       mat = Matrix<F>
%       Lgr  = LieGroup;
%       Lalg = LieAlgebra;
%       F = Number field (real or complex).
%    
%    Definitions:
%    -----------
%       The symplectic Lie algebra sp(2n) consists of all real
%       2nx2n matrices A with the property that A'*J*A = J, 
%       where J is the matrix [zeros(n) eye(n); -eye(n) zeros(n)].
%       The class is dynamically subtyped with the positive even
%       integer 2n as shape information.
%       
%    Operations:
%    ----------
%    
%    Constructor:
%       function [a] = lasp(varargin)
%       Result:
%          No argument:
%             a = lasp; 
%          Returns a generic element with no data and no shape.
%          
%          Single argument:
%             a = lasp(b); isa(b,'lasp') == 1;
%          Copy constructor that copies shape info, but discards data.
%             a = lasp(i); dmisinteger(i) == 1 & mod(i,2) == 0;
%          Constructs an lasp-object with shape set to 'i'.
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
%
%       See also LIEALGEBRA
      
% WRITTEN   BY: Kenth Engø, 1998.11.17
% MODIFIED  BY: Kenth Engø-Monsen, 2012.04.24
% VALIDATED BY:
% ACCEPTED  BY:
