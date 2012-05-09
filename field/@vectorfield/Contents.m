% SPECIFICATION OF: VectorField
% ----------------
% 
% SUMMARY: class VectorField
% -------
% 	Based on:
% 	--------
%          class Manifold
% 	   class MATLAB string
% 	   
% 	Properties: 
% 	----------
% 	   Vectorfield defines the flow of which the integral lines are
% 	   sought. 
%
% PURPOSE:
% -------
%    This class defines the minimal signature required for classes to
%    be called vectorfields. A vectorfield defines the flow, and it is the
%    integral lines of this flow that we seek. These integral lines are
%    computed by numerical methods. 
% 
% DESCRIPTION:
% -----------
%    Types:
%    -----
%       VectorF  = vectorfield
%       Man      = domain manifold - the homogeneous space
%       R        = real numbers
%       Str      = string
%    
%    Definitions:
%    -----------
%       A vector field over a manifold M is a cross section of the tangent
%       bundle of the manifold M, i.e. a vector field F is a morphism from M 
%       to TM;
%                  F : M -> TM
%       such that F(x) lies in the tangent space T_xM for each x in M. In
%       other words; pi o F = id, where pi is the projection from TM to M. 
% 
%    MATLAB representation:
%    ---------------------
%       A vector field object 'vf' is represented in MATLAB by the following
%       struct:
%                 vf -           : VectorF
%                 vf.domain      : Man
%                 vf.eqntype     : MATLAB string
%                 vf.fm2g        : MATLAB string
%
%    Operations:
%    ----------
%    Constructors:
%       function [vf] = vectorfield(varargin)
%       Result:
%          No argument:
%             vf = vectorfield;
%          Returns: generic vector field object 'vf'.
%
%          Single argument:
%             vf = vectorfield(input);
%          Returns:
%             If (class(input) == VectorF)
%                Vectorfield object 'vf' which is a copy of 'input'.  
%                This is the copy constructor. 
%             If (isa(input) == hmanifold),
%                Vectorfield object 'vf' with domain equal to 'input'.
%             If (class(input) == all-other-classes),
%                Illegal input.
%
%          Two or four arguments:
%             vf = vectorfield(f1,val1,f2,val2)
%          Returns:
%             If isstring(fi) == field-name),
%                vectorfield object where the field 'f1' is given the value 
%                'val1', 'f2' is given the value 'val2'.
%             If (any-other-input)
%                Illegal input.
%          Remark: The vector field object has only two struct fields that
%                  can be set this way: 'vf.eqntype' and 'vf.fm2g'.
%
%    Observers: 
%       getdomain : VectorF -> Man
%       function [man] = getdomain(vf)
%          Result: If the vector field object 'vf' has been assigned a
%                  domain object, this is returned. In case of no assigned
%                  domain object, it returns the empty matrix; [].
%
%       geteqntype : VectorF -> MATLAB string
%       function [str] = geteqntype(vf)            
%          Result: If the vector field object 'vf' has been assigned an
%                  equation type, this is returned. In case of no assigned
%                  equation type, it returns the empty matrix; [].
%                  Possible outputs are: 'G'/'g' - general type of equation
%                                        'L'/'l' - Lie type equation
%          Default: Default equation type is 'G'.
%
%       getfm2g : VectorF -> MATLAB string
%       function [str] = getfm2g(vf)
%          Result: If the vector field object 'vf' has been assigned a map
%                  from the manifold to the Lie algebra, this is
%                  returned. In case of no assigned map, it returns the
%                  empty matrix; []. 
%           
%       --- Optional observers --- 
%       display : VectorF -> screen
%       function [] = display(vf)
%          Result: Displays the vectorfield object 'vf'. If 'vf' has
%                  non-empty struct fields, this information is also
%                  displayed.
%
%    Generators:
%       setdomain : VectorF,Man -> VectorF
%       function [] = setdomain(upd vf,dom)
%          Result: Sets the domain of the vector field object 'vf' to equal
%                  'dom' 
%
%       seteqntype : VectorF,Str -> VectorF
%       function [] = seteqntype(upd vf,str)            
%          Result: Sets the equation type of the vector field object 'vf'.
%
%       setfm2g : VectorF,Str -> VectorF
%       function [] = setfm2g(upd vf,str)
%          Result: Sets the map describing the differential equation - this
%                  is just a string containing the name.
%           
%       --- Optional generators ---
%             
%    Conventions:
%       See diffmanstandards.doc.

% Written by      : Kenth Engø, 1998 May.
% Last updated by : Kenth Engø, 1999.03.05
% Validated by    :
% Accepted by     :   
