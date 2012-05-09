% SPECIFICATION OF: TimeStepper
% ----------------
% 
% SUMMARY: class TimeStepper
% -------
% 	Based on:
% 	--------
%          None
%
% 	Properties: 
% 	----------
% 	   Timestepper advances along an integral line of a flow defined by
% 	   a vector field.
% 	  
% PURPOSE:
% -------
%    This class defines the minimal signature required for classes to be
%    called timesteppers. Timesteppers are our tool for advancing our
%    solution along the integral line of a flow defined by a vector field. 
% 
% DESCRIPTION:
% -----------
%    Types: 
%    -----
%       TS      = timestepper
%       R       = real numbers
%       Str     = string
%       VectorF = vector field
%       Man     = domain manifold - the homogeneous space
%
%    Definitions:
%    -----------
%       Objects of the timestepper class advance the flow along the integral
%       curve through an initial point on the manifold and initial time. The
%       solution is advanced one time step (defined by the discretization
%       parameter h) by a numerical algorithm. 
%    
%    MATLAB representation:
%    ---------------------
%       A timestepper object 'tsobj' is represented in MATLAB by the
%       following struct:
% 
%                  tsobj -           : TS
%                  tsobj.coordinate  : MATLAB string
%                  tsobj.method      : MATLAB struct
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = timestepper(varargin)
%       Result:
%          No argument: 
%             tsobj = timestepper;
%          Returns: timestepper superclass object 'tsobj'. 
%
%          Single argument:
%             tsobj = timestepper(a);
%          Returns:
%             If (isa(a) == timestepper),
%                Timestepper object 'tsobj' which is a copy of 'a'.
%                This is the copy constructor.
%             If (any-other-input),
%                Illegal input.
%
%          Multiple arguments:
%             tsobj = timestepper(a,arg2,arg3,...);
%          Returns:
%             If (class(a) == timestepper_subclass),
%                tsobj = timestepper_subclass(a,arg2,arg3,...);
%             In the case where the first argument is of a timestepper
%             subclass, tsobj equals the output of the subclass constructor
%             called with all the arguments to timestepper as input.
%             If (class(a) == all-other-classes),
%                Illegal input.
%
%    Observers:
%       getcoordinate : TS -> MATLAB string
%       function [str] = getcoordinate(tsobj)
%          Result: Returns a MATLAB string which is the name of the
%                  coordinate function from the Lie algebra to the Lie
%                  group. 
%          Examples of output are: 
%                  - 'exp' : canonical coordinates of the first kind.
%                  - 'cay' : Cayley transform. Exists for some matrix
%                            groups. 
%          Default: Default coordinates are 'exp'.
%          
%       getmethod : TS -> MATLAB struct
%       function [struct] = getmethod(tsobj)
%          Result: Returns a MATLAB structure 'struct' that contains all the
%                  informations about the numerical method.
%          Default: Default method is 'RK4'
%
%       --- optional observers --- 
%       display : TS -> screen
%       function [] = display(tsobj)
%         Result: Displays the timestepper object 'tsobj'. If 'tsobj' has
%                 non-empty struct fields, this information is also displayed.
%       
%    Generators:
%       setcoordinate : TS,Str -> TS
%       function [] = setcoordinates(upd tsobj,str)
%          Result: Sets the coordinates to be used on the domain manifold -
%                  this is just a string with the name of the coordinate
%                  map. 
%          Default: Default coordinates are 'exp'.
%          
%       setmethod : TS,Str -> TS
%       function [] = setmethod(upd tsobj,str)
%          Result: Assignes the numerical integrator of timestepper object
%                  'tsobj' to equal 'str'.
%
%       tsobj(...) : VectorF,Man,R,R -> Man
%       function [y] = subsref(tsobj,s)
%       Result: This function advances the flow of the vector field 'vf' 'h'
%               units of time along the integral curve from initial point
%               'p' on the manifold at time 't'.
%       Remark: This function has the generic call:
%                          ts(vf,p,t,h)
%               'tsobj' is the timestepper object being evaluated, while 's'
%               is a MATLAB struct that contains the parameter list where
%                      s.subs{1} = vf - Vector field object.
%                      s.subs{2} = p  - Initial point - isa(p,'hmanifold').
%                      s.subs{3} = t  - Initial time.
%                      s.subs{4} = h  - Step length.
%
%       --- optional generators ---
%             
%    Conventions:
%       See diffmanstandards.doc.

% Written by      : Kenth Engø, 1998 May.
% Last updated by : Kenth Engø, 1999.03.05
% Validated by    :
% Accepted by     :
   
