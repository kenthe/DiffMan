function [c] = la2lgshape(a)
% LA2LGSHAPE - Substitues 'la' with 'lg' in the a cell-'tree'.
% function [c] = la2lgshape(a)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 1999.04.12

c = a;
for i = 1:size(a,1),
  if strcmp(a{i,1},'ladirprod'),
    c{i,1}(2) = 'g';
    c{i,2} = la2lgshape(a{i,2});
  elseif strcmp(a{i,1},'latangent'),,
    c{i,1}(2) = 'g';
    error('Don''t know what to do in the case of ''latangent''');  
  elseif strcmp(a{i,1},'lasemprod'),,
    c{i,1}(2) = 'g';
    error('Don''t know what to do in the case of ''lasemprod''');  
  else,
    c{i,1}(2) = 'g';
  end;
end;
return;
