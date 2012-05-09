function [] = dmdirectories
% DMDIRECTORIES - Prints a schematic outline of DiffMans directory structure.
% function [] = dmdirectories

% WRITTEN BY       : Kenth Engø, 2000 Sept.
% LAST MODIFIED BY : None

clc
disp('  ');
disp('  Outline of DiffMan directory structure  ');
disp('  ');
disp('  DM/auxiliary/');
disp('               demos/                 Demos and tutorials');
disp('               documentation/         User''s guide, etc. ');
disp('               examples/              DiffMan examples   ');
disp('                        exacta/       Examples from Acta paper ');
disp('                        exlafree/     Free Lie algebra examples ');
disp('                        expolar/      Polar decomposition examples ');
disp('                        exprog/       Programming examples ');
disp('                        extools/      Tools examples ');
disp('  ');
disp('               utilities/             Utility functions  ');
disp('                        flowtools/    Tools for checking order of methods');
disp('                        lafreeutil/   Free Lie algebra tools ');
disp('  ');
disp('  DM/domain/');
disp('            hmanifold/                Homogeneuous spaces');
disp('                      @hmanifold/     Generic class');
disp('                      @hmisospec/     Isospectral flow');
disp('                      @hmlie/         Lie group acting on itself');
disp('                      @hmnsphere/     Rotations on an n-sphere');
disp('                      @hmrigid/       Rigid body');
disp('                      @hmrn/          n-dimensional vector space');
disp('                      @hmsineeuler/   Sine-Euler');
disp('                      @hmtop/         Heavy top');
disp('  ');
disp('            liealgebra/               Lie algebras');
disp('                       @ladirprod/    Direct product functor class');
disp('                       @lafree/       Free Lie algebra');
disp('                       @lagl/         gl(n)');
disp('                       @larn/         Euclidian space');
disp('                       @lase/         se(n)');
disp('                       @lasl/         sl(n)');
disp('                       @laso/         so(n)');
disp('                       @laso_pq/      so(p,q)');
disp('                       @lasp/         sp(n)');
disp('                       @lasu/         su(n)');
disp('                       @latangent/    Tangent bundle functor class');
disp('                       @laun/         u(n)');
disp('                       @liealgebra/   Generic class');
disp('  ');
disp('            liegroup/                 Lie groups');
disp('                      @lgdirprod/     Direct product functor class');
disp('                      @lggl/          GL(n)');
disp('                      @lgon/          O(n)');
disp('                      @lgon_pq/       O(p,q)');
disp('                      @lgrn/          Euclidian space');
disp('                      @lgse/          SE(n)');
disp('                      @lgsl/          SL(n)');
disp('                      @lgso/          SO(n)');
disp('                      @lgso_pq/       SO(p,q)');
disp('                      @lgsp/          SP(n)');
disp('                      @lgsu/          SU(n)');
disp('                      @lgtangent/     Tangent bundle functor class');
disp('                      @lgun/          U(n)');
disp('                      @liegroup/      Generic class');
disp('  ');
disp('  DM/field/                           Fields over domains');
disp('           @vectorfield/              Vector field over manifold');
disp('  ');
disp('  DM/flow/                            Flows');
disp('          @flow/                      Generic class');
disp('          timestepper/                Timestepper used to advance flow');
disp('                      @timestepper/   Generic class');
disp('                      @tscg/          Crouch-Grossman method');
disp('                      @tsfer/         Fer expansion');
disp('                      @tslieqn/       Free Lie algebra speed hack');
disp('                      @tsmagnus/      Magnus series');
disp('                      @tsprkmk/       Partitioned RKMK type method');
disp('                      @tsqq/          Cayley series for quadratic groups');
disp('                      @tsrk/          Classical Runge-Kutta method');
disp('                      @tsrkmk/        Runge-Kutta-Munthe-Kaas method');
disp('                      @tsrkmkgeo/     Geodesic symmetric RKMK');
disp('                      @tsscg/         Time-symmetric Crouch-Grossman');
disp('                      @tssym/         Flow-symmetric RKMK');
disp('  ');
return;

