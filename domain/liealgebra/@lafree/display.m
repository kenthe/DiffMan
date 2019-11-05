function display(obj)
% DISPLAY - Diffman: LIEALGEBRA class LAFREE function

% WRITTEN BY       : Hans Munthe-Kaas, 1997 Sept.
% LAST MODIFIED BY : Kenth Engø-Monsen, 2019.11.05

if (nargin ~= 1)|(nargout ~= 0),
  error('Wrong number of input/output arguments!');
end;

line1 = sprintf('%s =', inputname(1));
fprintf('%s\n', line1);

if max(size(obj)>1), % The object is an array of objects
    [m,n] = size(obj);
    lal = class(obj);
    disp(['Class: ' lal])
    disp(['Size:  ' num2str(m) 'x' num2str(n)]);
    disp('Fieldnames:');
    fields = fieldnames(obj);
    for i = 1:length(fields)-1,
      disp(['       ' fields{i}]);
    end;
    disp(' ');
    return;
end;


% display info about the algebra
lal = class(obj);
disp(['   LieAlgebra class: ' lal]);
if isempty(obj.weights),
	if hasshape(obj),
	   sh = getshape(obj);
	   if ~isempty(sh),
	      disp('   Shape:');
	      str= ['     {[' int2str(sh{1}) '],[' int2str(sh{2}) ']}'];
	      disp(str);
	   else,
	      return;
	   end;
      bvec = 1:dimension(obj);
      wvec = 1:dimension(obj)';
   	disp('   Basis vectors:');
   	basisdisp = 1;
	end;
	if dimension(obj)>300,
	   disp('      (only the first 300):');
	   bvec = bvec(1:300);
	end;
else,
% display info about the vector
	disp('   Data:');
   bvec = find(obj.weights)';
   wvec = obj.weights;
	basisdisp = 0;
end;
ratdisp = strcmp(get(0,'format'),'rational');
if ~isempty(bvec),
   dstr = '';
   for i = bvec,
      cstr = basvec2str(getlafdata(obj),i);
      if ~any(cstr=='['),
         cstr = ['[' cstr ']'];
	 end;
	 if ~ratdisp,
         nstr = num2str(abs(wvec(i)));
	 else,
		 [num,dem] = rat(abs(wvec(i)));
		 if dem ~= 1,
		    nstr = [int2str(num), '/', int2str(dem)];
		 else,
		    nstr = int2str(num);
		 end;
	 end;
      if strcmp(nstr,'1'),
         nstr = '';
      else,
         nstr = [nstr '*'];
      end;
      if wvec(i)>0,
         sstr = ' + ';
      else,
         sstr = ' - ';
      end;
      dstr = [dstr sstr nstr cstr];
   end;
   if dstr(2)=='+',
      dstr(1:3) = '';
   else,
      dstr(3) = '';
      dstr(1) = '';
   end;
   linelng = 60; % cut line first suitable place after this
   if basisdisp,
      dstr(find(dstr=='*')) = ':';
      dstr(find(dstr=='+')) = '';
      dstr = ['  1:' dstr];
   end;
   while length(dstr)>0,
      seppt = findstr(dstr,'] ');
      seppt(seppt<linelng) = '';
      sp = min(seppt);
      if ~isempty(sp),
         if basisdisp,
            disp(['   ' dstr(1:sp+1)]);
         else,
            disp(['     ' dstr(1:sp+1)]);
         end;
         dstr = [dstr(sp+1:length(dstr))];
      else, % no proper cut found, display the whole string
         if basisdisp,
            disp(['   ' dstr]);
         else,
            disp(['     ' dstr]);
         end;
         dstr = '';
      end;
   end;
else,
   disp('     0');
end;
