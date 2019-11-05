function [] = display(obj)
% DISPLAY - Display a FLOW object.

% WRITTEN BY       : Kenth Engø, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

global DMARGCHK

if DMARGCHK
end;

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

disp('Class: flow');
vf = obj.vectorfield;
ts = obj.timestepper;
if ~isempty(vf),
  disp(['Vector field information:']);
  if ~isempty(getdomain(vf)),
    disp(['    Domain:          ' class(getdomain(vf))]);
  end;
  type = geteqntype(vf);
  if ~isempty(type),
    if strcmp(lower(type(1)),'l'),
      type = 'Linear';
    else
      type = 'General';
    end;
    disp(['    Equation type:   ' type]);
  end;
  if ~isempty(getfm2g(vf)),
    disp(['    Map defining DE: ' getfm2g(vf)]);
  end;
end;
if ~isempty(ts),
  disp(['Timestepper class: ' class(ts)]);
  if ~isempty(getcoordinate(ts)),
    disp(['    Coordinates:   ' getcoordinate(ts)]);
  end;
  meth = getmethod(ts);
  if ~isempty(meth),
    disp(['    Method:        ' meth.RKname]);
  end;
end;
return;
