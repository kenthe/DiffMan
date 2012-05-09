function [obj] = pi(a,n)
% PI - Returns the n'th component object of LADIRPROD.
%      This function also handles vectors of LADIRPROD objects.
% function [obj] = pi(a,m)

% WRITTEN BY       : Kenth Engø, 2000 Apr.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24

global DMARGCHK

if DMARGCHK,
  if (n < 1)|(n > a(1).n)|~dmisinteger(n),
    error(['Input integer must be in the interval: 1 <= n <= ' int2str(a.n) '!']);
  end;
end;

sh = a(1).shape{2}(n,:);

if strcmp(sh{1},'latangent'),
  obj = latangent;
  setshape(obj,sh);
elseif strcmp(sh{1},'ladirprod'),
  obj = ladirprod;
  setshape(obj,sh);
else, 
  obj = eval([sh{1} '(' int2str(sh{2}) ')']);
end;

if length(a) == 1,
  if isempty(a(1).data{n}),
    return;
  else
    setdata(obj,a(1).data{n})
  end;
else
  objn(length(a)) = obj;
  for i = 1:length(a),
    objn(i) = obj;
    if ~isempty(a(1).data{n}),
      tmp = obj;
      setdata(tmp,a(i).data{n})
      objn(i) = tmp;
    end;
  end;
  obj = objn;
end;
return;

