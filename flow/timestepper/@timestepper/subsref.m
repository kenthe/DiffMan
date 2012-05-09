function out = subsref(ts,s)
% SUBSREF - This function overloads the parenthesis of a timestepper object.
% function out = subsref(ts,s)
%
% REMARK:   When a timestepper object is evaluated, a numerical integrator
%           specified by the timestepper class is used to advance the flow
%           'h' units of time along the integral curve through the point 'p'
%           at time 't' to the point 'y' on the homogeneous manifold. The
%           integral line is defined by the flow of the vector field 'vf'.
%
% FUNCTION CALL:
%           function out = ts(vf,p,t,h)
%
% INPUT:
%           ts - Timestepper object being evaluated.
%           s  - Matlab struct that contains the input variables:
%                s.subs{1} = vf - Vector field object.
%                s.subs{2} = p  - Initial point - isa(p,'hmanifold').
%                s.subs{3} = t  - Initial time.
%                s.subs{4} = h  - Step length.
%
% OUTPUT: 
%           out - The new point on the integral line:
%                    out.ylow=ylow     (low order)
%                    out.yhigh=yhigh   (high order)
%                    out.errest=errest (error estimate)
%                 or
%                    out.ylow=ylow     (low order)
%                    out.errest=-1     (error estimate)
%                 when integrating using constant stepsize
%
% REFERENCE: 
%           http://www.math.ntnu.no/num/synode/

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 1999.04.08

global DMARGCHK

n = length(s.subs);
if DMARGCHK
  if ~isa(s.subs{1},'vectorfield'),
    error('First argument is no vectorfield object');
  end;
  if ~isa(s.subs{2},'hmanifold'),
    error('First argument is no manifold object');
  end;
  if ~isreal([s.subs{3} s.subs{4}]),
    error('Non-scalar argument as input number 3 or 4');
  end;
end;

error(['Function not defined in class: ' class(ts)]);
return;
