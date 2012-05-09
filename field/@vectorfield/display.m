function [] = display(obj)
% DISPLAY - Display a VECTORFIELD object.
% function [] = display(obj)

% WRITTEN BY       : Kenth Engø, 1998 June.
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

isLoose = strcmp(get(0,'FormatSpacing'),'loose');
line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);
if (isLoose)
  fprintf('\n');
end;

disp('Class:  vectorfield');
dom  = obj.domain;
if strcmp(lower(obj.eqntype),'l'),
  type = 'Linear';
else,
  type = 'General';
end;
map  = obj.fm2g;
if ~isempty(dom),
  disp(['Domain: ' class(dom)]);
  if hasshape(dom),
    sh = getshape(dom);
    shcls = class(sh);
    disp(['Shape-object information:']);
    disp(['   Class: ' shcls]);
    if strcmp(shcls,'lgtangent'),
      disp(['   Shape: ' dmshstr(getshape(sh))]);
    elseif strcmp(shcls,'lgdirprod'),
      disp(['   Shape: ' dmshstr(getshape(sh))]);
    elseif ~isempty(sh),
      disp(['   Shape: ' int2str(getshape(sh))]);
    end;
  end;
end;
if ~isempty(map),
  disp(['Map fm2g:   ' map]);
end;
if ~isempty(type),
  disp(['Eqn type:   ' type]);
end;
return;
