function [dat] = getdata(u)
% GETDATA - Returns the data of element u.
% function [dat] = getdata(u)

% WRITTEN BY       : Kenth Engo, 1997 Oct.
% LAST MODIFIED BY : Kenth Engø, 2000.04.10

len = length(u);
if len == 1,
  if isempty(u.data), dat = []; return; end;
  dat = u.data;
else,					% length(u) > 1.
  sh = u(1).shape;
  if strcmp(class(sh),'lgdirprod')|strcmp(class(sh),'ladirprod'),
    dat = cell(len,1);
    for i = 1:len,
      dat{i} = u(i).data;
    end;
  elseif strcmp(class(sh),'lgtangent')|strcmp(class(sh),'latangent'),
    dat = cell(len,1);
    for i = 1:len,
      dat{i} = u(i).data;
    end;
  else
    n = sum(getshape(sh));
    if hasmatrix(sh),
      dat = zeros(n,n,len);	% Creates matrix: n x n x len.
      for i = 1:len,
        mat = u(i).data;
        if isempty(mat), else, dat(:,:,i) = mat; end;
      end;
    else
      dat = zeros(n,len);
      for i = 1:len,
        vec = u(i).data;
        if isempty(vec), else, dat(:,i) = vec; end;
      end;
    end;
  end;
end;
return;

