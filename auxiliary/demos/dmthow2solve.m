function slide=dmthow2solve
% This is a slideshow file for use with playshow.m and makeshow.m
% To see it run, type 'playshow dmthow2solve', 

% Copyright (c) 1984-98 by The MathWorks, Inc.
if nargout<1,
  playshow dmthow2solve
else
  %========== Slide 1 ==========

  slide(1).code={
   'xptext( '' '' , '' '', ''      How to solve ODEs in DiffMan'' , ''  ''  , ''         Example of ODE on SO(3)'' , '' '' , ''    Linear type equation:  y'''' = a(t)y'')' };
  slide(1).text={
   '',
   '        Welcome to this DiffMan tutorial on how to sovle ODEs.',
   '',
   '    To be able to solve an ordinary differential equation in DiffMan,',
   '    you have to go through a 5 step procedure. This tutorial will',
   '    carefully take you through these steps.'};

  %========== Slide 2 ==========

  slide(2).code={
   'xptext(''Create an initial object in @hmlie and set'' ,''the ''''shape'''' equal to lgso(3):'' , '' '' ,''   >> y = hmlie(lgso(3));'' , '' '', ''Set the data of ''''y'''':'' , '' '' ,''   >> setdata(y,eye(3));'');' };
  slide(2).text={
   '                                       Step #1:',
   '',
   '      Construct an initial domain object in a homogeneous space.',
   '',
   '    In order to solve your ODE, DiffMan needs to know an initial',
   '    condition. Choose the homogeneous space most appropriate to',
   '    your problem and create an object of this class with the initial',
   '    condition as data. Above you see an example of this.'};

  %========== Slide 3 ==========

  slide(3).code={
   'xptext(''Create a vector field object ''''vf'''' over '' , ''the domain hmlie(lgso(3)):'' , '' '', ''   >> vf = vectorfield(y);'' , '' '', ''Set the equation type to ''''Linear'''':'' , '' '' ,''   >> seteqntype(vf,''''Linear'''');'')',
   '' };
  slide(3).text={
   '                                       Step #2',
   '',
   '      Construct a vectorfield object over the domain object.',
   '',
   '    We want to find the integral curve of this vector field through',
   '    the initial point. A vector field object consists of three parts:',
   '',
   '            Domain, Equation type, and Generator map.'};

  %========== Slide 4 ==========

  slide(4).code={
   'xptext(''Set the ''''Generator map'''' to ''''vfex1'''':'' , '' '' ,''   >> setfm2g(vf,''''vfex1'''');'' , '' '', ''To see how ''''vfex1'''' is structured:'' , '' '', ''   >> dmhelp examples/vfex1'' , '' '', ''and push the buttown ''''View src''''.'')',
   '' };
  slide(4).text={
   '                               Step #2 - Continuation',
   '',
   '=>  The ''Domain'' attribute is set in the call to the vectorfield',
   '      constructor if a domain object is supplied as an agument.',
   '=>  The ''Equation type'' is set to equal whatever type the ODE is:',
   '      ''Linear'' or ''General''. Use the function ''seteqntype'' to set type.',
   '=>   The ''Generator map'' is the map from RxM -> g that describes',
   '      the ODE in the sense that the ODE can be written as a',
   '      infinitesimal generator with respect to the action and this map.'};

  %========== Slide 5 ==========

  slide(5).code={
   'xptext(''Create a timestepper object ''''ts'''':'' , '''' , ''   >> ts = tsrkmk;'', '''' , ''The above command gives you a timestepper'', ''object with default settings:'', '' '', ''     Coordinate = exp'' , ''     Method     = RK4'' )' };
  slide(5).text={
   '                                       Step #3',
   '',
   '                       Construct a timestepper object',
   '',
   '    The timestepper class determines the numerical method used to',
   '    advance the numerical solution along the integral line. A time-',
   '    stepper object consists of two parts; what ''Coordinate'' to use',
   '    on the group, and what numerical ''Method'' to use.',
   ''};

  %========== Slide 6 ==========

  slide(6).code={
   'xptext( ''To change to other coordinates:'' , '' '' , ''   >> setcoordinate(ts,''''cay''''); '', '' '' , ''To change to another method:'', '' '', ''   >> setmethod(ts,''''butcher6'''');'' )' };
  slide(6).text={
   '                               Step #3 - Continuation',
   '',
   '=> ''Coordinate'' is set with the function ''setcoordinate''. In DiffMan',
   '    Version 1.5 there are three types of coordinates implemented:',
   '    ''exp'', ''cay'', and ''pade22''. See the Users Guide for restrictions',
   '    on  what coordinates to be used by which group and method.',
   '=> ''Method'' is set using the function ''setmethod''. To get a listing',
   '    of all numerical methods, use ''dmhelp timestepper/setmethod''.'};

  %========== Slide 7 ==========

  slide(7).code={
   'xptext(''Construct a flow object ''''f'''':'' , '''' , ''   >> f = flow;'' , '''' , ''The above command gives you a flow object'' , ''with the following default timestepper:'', ''Timestepper class: tsrkmk'',''    Coordinates:   exp'',''    Method:        RK4'')' };
  slide(7).text={
   '                                        Step #4',
   '',
   '                            Construct a flow object.',
   '',
   '    A flow is defined through the vector field, hence, the flow object',
   '    need information about the ''Vectorfield''. Because the solution',
   '    will be obtained numerically, the flow object also needs',
   '    information about the ''Timestepper'' - how to step forward.'};

  %========== Slide 8 ==========

  slide(8).code={
   'xptext( '' '' , ''Set timestepper and vectorfield:'', '' '', ''   >> settimestepper(f,ts);'', ''   >> setvectorfield(f,vf);'')' };
  slide(8).text={
   '                                Step #4 - Continuation',
   '',
   '=>  ''Timestepper'' is set by the function ''settimestepper''. For a list of',
   '      all possible timesteppers, use ''dmhelp timestepper''.',
   '',
   '=>  ''Vectorfield'' is set by the function ''setvectorfield''.'};

  %========== Slide 9 ==========

  slide(9).code={
   'xptext( ''Solve the ODE defined by the flow object'',''''''f'''':'', '''' , ''   >> ouput = f(y,0,1,0.1);'' , '' '' , ''''''output'''' is a MATLAB struct with 3 fields:'' , ''output.y   - vector of domain objects'' , ''output.t   - vector of time points'' , ''output.rej - vector indicating rejection'')' };
  slide(9).text={
   '                                       Step #5',
   '',
   '                                 Solve the ODE.',
   '',
   '    Solving the ODE defined by the flow object is done simply by',
   '    evaluating the flow object at the inital domain object, fstart,',
   '    tfinal, and stepsize:',
   '                          >> output = f(y,tstart,tfinal,h);'};
end