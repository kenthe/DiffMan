%-*-text-*-
function [c] = lg2lashape(a)
% LG2LASHAPE - Substitues 'lg' with 'la' in the 'a' cell-'tree'.
% function [c] = lg2lashape(a)

% WRITTEN BY       : Kenth EngÅ¯, 1998 Nov.
% LAST MODIFIED BY : Kenth EngÅ¯, 2000.03.27

c = a;
for i = 1:size(a,1),
  if strcmp(a{i,1},'lgdirprod'),
    c{i,1}(2) = 'a';
    c{i,2} = lg2lashape(a{i,2});
  elseif strcmp(a{i,1},'lgtangent'),
    c{i,1}(2) = 'a';
    c{i,2} = lg2lashape(a{i,2});
  elseif strcmp(a{i,1},'lgsemprod'),
    c{i,1}(2) = 'a';
    error('Don''t know what to do in the case of ''lgsemprod''');  
  elseif strcmp(a{i,1},'lgon'),
      c{i,1} = 'laso';
  else,
    c{i,1}(2) = 'a';
  end;
end;
return;
