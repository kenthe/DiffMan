function slide=dmtdomains
% This is a slideshow file for use with playshow.m and makeshow.m
% To see it run, type 'playshow dmtdomains', 

% Copyright (c) 1984-98 by The MathWorks, Inc.
if nargout<1,
  playshow dmtdomains
else
  %========== Slide 1 ==========

  slide(1).code={
   'xptext('' '' ,''DiffMan Domains:'', '' '', ''hmanifold  - Homogeneous spaces'', ''liealgebra - Lie algebras'', ''liegroup   - Lie groups'');',
   '' };
  slide(1).text={
   '',
   '                    Welcome to this DiffMan tutorial on Domains.',
   '',
   '    In DiffMan version 1.5 three types of domains are implemented.',
   '    See the above listing. Each domain is further divided up into a',
   '    collection of classes. In this tutorial we will go through the',
   '    domains and list these classes.'};

  %========== Slide 2 ==========

  slide(2).code={
   'xptext(  '' '' , ''@hmanifold - Generic superclass'', ''@hmisospec - Isospectral flows'', ''@hmlie     - Groups acting on them selves'', ''@hmnsphere - SO(n-1) acting on S^n'' , ''@hmrigid   - The rigid body'' , ''@hmrn      - Algebras acting on R^n'', ''@hmtop     - The heavy top'')' };
  slide(2).text={
   '',
   '                                Homogenous spaces',
   '',
   '    A homogenous space consists of a triple: (G,Phi,M). G is a Lie',
   '    group, and Phi is an action of G on the manifold M. In version',
   '    1.5 of DiffMan there are 7 homogeneous spaces to choose form.',
   '    See the above list. For more details about each space; use',
   '    ''dmhelp myhspace''.'};

  %========== Slide 3 ==========

  slide(3).code={
   'xptext( ''@liealgebra - Generic superclass'', ''@ladirprod  - Direct product Lie algebras'', ''@lafree     - The free Lie algebra'', ''@lagl       - General linear algebra GL(n)'' , ''@larn       - R^n as Lie algebra'' , ''@lase       - Special Euclidean algebra'', ''@lasl       - Special linear algebra SL(n)'', ''@laso       - Special orthogonal algebra'', ''@lasp       - Symplectic algebra Sp(n)'')' };
  slide(3).text={
   '',
   '                                        Lie algebras',
   '',
   '    A vector spaces with the additional structure of a commutator',
   '    is called a Lie algebra. Most of the above Lie algebras are matrix',
   '    Lie algebras where the commutator is defined as [A,B] = AB-BA.',
   '    New Lie algebras can be constructed by the ''ladirprod'' class,',
   '    and ''lafree'' can be used to optimize commutator expressions.',
   '    See the Users Guide for further details.'};

  %========== Slide 4 ==========

  slide(4).code={
   'xptext(''@liegroup  - Generic superclass'', ''@lgdirprod - Direct product Lie groups'' , ''@lggl      - General linear group GL(n)'' , ''@lgon      - Othogonal group O(n)'' , ''@lgrn      - R^n with vector addition'' , ''@lgse      - Special Euclidean group SE(n)'' , ''@lgsl      - Special linear group SL(n)'' , ''@lgso      - Special orthogonal group SO(n)'' , ''@lgsp      - Symplectic group Sp(2n)'' )' };
  slide(4).text={
   '',
   '                                         Lie groups',
   '',
   '    A smooth manifold with a continuous group structure is called a',
   '    Lie group. Direct products of groups can be made by ''lgdirprod''.',
   '    Six of the above groups are matrix Lie groups, where the group',
   '    multiplication is matrix multiplication.'};
end