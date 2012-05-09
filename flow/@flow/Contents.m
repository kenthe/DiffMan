% SPECIFICATION OF: Flow
% ----------------
% 
% SUMMARY: class Flow
% -------
% 	Based on:
% 	--------
%          class TimeStepper
%          class VectorField
% 
% 	Properties: 
% 	----------
% 	   Flow operator of a vector field.
% 	  
% PURPOSE:
% -------
%    This class defines the minimal signature required for classes to be
%    called flows. Flows are important in our applications, since all
%    numerical methods for the solution of DEs are approximations to
%    integral curves of flows.
% 
% DESCRIPTION: 
% -----------
%    Types: 
%    -----
%       Flow 	= flow of a vector field
%       VectorF = vector field over the domain
%       TS      = timestepper
%       R   	= real numbers
%       Man 	= domain manifold - the homogenous space
%       Str     = string
%       Bool    = {0,1}
%    
%    Definitions:
%    -----------
%       A flow is an action of the group G = R on the domain M.
%       Psi: R x M -> M, is the flow operator of a given vector  
%       field, such that the following is fullfilled:
% 	  1) Psi(0,m) = m  for all m in M.
%    	  2) Psi(t,Psi(s,m)) = Psi(t+s,m) for all t,s in R and all m in M.
%       Alternatively, a flow can be defined as a homomorphism from R to
%       Diff(M) - the group of diffeomorphisms on M - taking t to
%       Psi_t. Thus 0 -> Id_M and (t+s) -> Psi_(t+s) = Psi_t o Psi_s.
%
%    MATLAB representation:
%    ---------------------
%       A flow object 'fobj' is represented in MATLAB by the following struct:
% 
%                   fobj -           : Flow
%                   fobj.defaults    : MATLAB struct
%                   fobj.timestepper : TS
%                   fobj.vectorfield : VectorF
%
%    Operations:
%    ----------
%    Constructors:
%       function [a] = flow(varargin)
%       Result:
% 	   No argument:
% 	      f = flow;
%          Returns: Generic flow class object 'f', where 'f.defaults' and
%                   'f.timestepper' are set to their default values.
%
% 	   Single argument: 
% 	      a = flow(b);
%          Returns:
% 	      If (class(b) == Flow), 
%                Flow object 'a' which is a copy of 'b' - Copy constructor. 
%             If (isa(b) == TS)
%                Flow object 'a' where timestepper field is equal to
%                'b'. This overrides the default timestepper.
%             If (isa(b) == VectorF)
%                Flow object 'a' where vectorfield-field is equal to
%                'b'. 
%             If (b == all-other-input)
%                Illegal input.
%
% 	   Two input arguments:
% 	      a = flow(arg1,arg2);
% 	   Returns:
%             If ((isa(arg1) == TS)&(class(arg2) == VectorF)) | ((isa(arg2)
%             == TS)&(class(arg1) == VectorF)) 
%                Flow object where vector field and timestepper is set
%                according to the two input arguments.
%             If (nargin > 2) | (any-other-input)
%                Illegal input.
%
%    Observers: 
%       getdefaults : Flow -> screen
%       function [] = getdefaults(f)
% 	Result: Prints all the default settings of the flow object 'f' to
% 	        the screen.
%
%       gettimestepper : Flow -> TS
%       function [ts] = gettimestepper(f)
% 	Result: Returns the default timestepper object to 'f', unless the
% 	        timestepper has been modified by the user.
%
%       getvectorfield : Flow -> VectorF
%       function [vf] = getvectorfield(f)
%          Result: If the flow object 'f' has been assigned a vector field
%                  object, this is returned. In case of no assigned vector
%                  field, it returns the empty matrix; []. 
% 
%       --- Optional observers --- 
%       display : Flow -> screen
%       function [] = display(f)
%   	Result: Display the flow object f. If f has non-empty struct 
% 		fields, this information is also displayed. 
% 
%    Generators:
%       f(...) : Man,R,R,R,... -> Man,R
%       function [icurve] = subsref(f,s)
% 	Result: Approximates the integral curve of the flow 'f' through 
% 		'p' by a numerical integrator, from 't0' to 'tf' using
% 		stepsize 'h'.  
% 	More precisely: The output is a structure icurve with two
% 			fields: icurve.y - vector of objects on the
% 					   evolving domain, and
% 				icurve.t - vector of timesteps. 
%       Remark: This function has the generic call:
%                          f(p,t0,tf,h,...)
%               'f' is the flow object being evaluated, while 's' is a
%               MATLAB struct that contains the parameter list where 
%                          s.subs{1} = p 
%                          s.subs{2} = t0 
%                          s.subs{3} = tf
%                          s.subs{4} = h
%                          s.subs{5} = ... etc.
% 	        The 4 first arguments are specified by this signature,
% 		but it is possible to pass additional arguments to the
% 		integrator.
%
%       setdefaults : Flow,Str,Value,Str,Value,... -> Flow
%       function [] = setdefaults(upd f,var1,val1,var2,val2,...)
%          Result: Sets the default variable 'var1' to equal the value
%                  'val1', etc.
%          Remark: These default values are mainly parameters needed in the 
%                  controlling of variable stepping. Unless not specially 
%                  interested, the common user are not to change these
%                  default values. 
% 
%       settimestepper : Flow,TS -> Flow
%       function [] = settimestepper(upd f,tsobj)
% 	   Result: Sets 'tsobj' to be the timestepper object of the flow
% 	           'f'. 
%
%       setvectorfield : Flow,VectorF -> Flow
%       function [] = setvectorfield(upd f,vf)
%          Result: Sets the vectorfield-field of the flow object 'f' to
%                  equal 'vf'. 
%
%       newstepsize : Flow,R -> R,Bool
%       function [hnew,accepted] = newstepsize(f,errest)
%          Result: Computes a new stepsize to be used by Stepper.
%
%       --- Optional generators ---
%
%    Conventions:
%       See diffmanstandard.doc 
      
% WRITTEN BY       : Kenth Engø, 1998 May.
% LAST MODIFIED BY : Kenth Engø, 1999.03.05
% VALIDATED BY     :
% ACCEPTED  BY     :
