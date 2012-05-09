function [] = setmethod(ts,method)% SETMETHOD - Assignes the numerical scheme to be used by the timestepper object.
% function [] = setmethod(ts,method)
%
% INPUT:
%        method - Either the number of the method or a sting containing an
%                 abbreviated name for method.
%
%        Numbering is performed as follows:
%
%           * 1-299:   classical Runge-Kutta coefficients - may also
%                      be used in the Munthe-Kaas and Crouch-Grossman
%                      methods: explicit methods
%           * 300-499: classical Runge-Kutta coefficients - may also
%                      be used in the Munthe-Kaas and Crouch-Grossman
%                      methods: implicit methods
%           * 500-599: Crouch-Grossman methods - the coefficients
%                      may also be used for classical Runge-Kutta or
%                      Munthe-Kaas methods
%           * 600-699: Magnus type methods
%           * 700-799: Fer type methods
%           * 1000-> : special kind of coefficients for particular
%                      methods
%
%        Note that only some of these numbers are in use.
%
%  Number   String            Description of method
%  ^^^^^^   ^^^^^^            ^^^^^^^^^^^^^^^^^^^^^
%
%   Classical Runge-Kutta coefficients: explicit methods
%
%     1     'E1'            - Explicit Euler, order 1
%     2     'ME2'           - Modified Euler, order 2
%     3     'heun2'         - Heun's 2nd order method
%     4     'ode23'         - The method implemented in the MATLAB
%                             ode23 routine
%     5     'moan25'        - Moan's method, order 2(5)
%     6     'moan35'        - Moan's method, order 3(5)
%     7     'RK4'           - "The" Runge-Kutta method, order 4
%     8     'rk45'          - Runge-Kutta method, order 4(5)
%     9     'RKF34'         - Fehlberg's method of order 3(4)
%    10     'RKF43'         - Fehlberg's method of order 4(3)
%    11     'RKF45a'        - Fehlberg's method of order 4(5) (a)
%    12     'RKF54a'        - Fehlberg's method of order 5(4) (a)
%    13     'RKF45b'        - Fehlberg's method of order 4(5) (b)
%    14     'RKF54b'        - Fehlberg's method of order 5(4) (b)
%    15     'dopri45'       - Dormand and Prince's method of order 4(5)
%    16     'dopri54'       - Dormand and Prince's method of order 5(4)
%    17     'butcher6'      - Butcher's method, order 6
%    18     'RKF78'         - Fehlberg's method of order 7(8)
%    19     'RKF87'         - Fehlberg's method of order 8(7)
%    20     'dopri78'       - Dormand and Prince's method of order 7(8)
%    21     'dopri87'       - Dormand and Prince's method of order 8(7)
%
%   Classical Runge-Kutta coefficients: implicit methods
%
%   300     'IE1'           - Implicit Euler, order 1
%   301     'GL2' 'IM2'     - Gauss-Legendre/implicit midpoint, order 2
%   302     'GL4'           - Gauss-Legendre, order 4
%   303     'GL6'           - Gauss-Legendre, order 6
%   304     'TRAP2'         - Trapozoidal rule of 2nd order.
%   305     'GL4S'          - Time symmetric GL method of order 4
%   306     'GL6S'          - Time symmetric GL method of order 6
%   307     'LobattoIIIA4'  - Lobatto IIIA method of order 4.
%   308     'LobattoIIIA6'  - Lobatto IIIA method of order 6.
%
%   Crouch-Grossman methods
%
%   500     'CG23'          - Crouch-Grossman method of order 2(3)
%   501     'CG3a'          - Crouch-Grossman method of order 3
%   502     'CG43'          - Crouch-Grossman method of order 4(3)
%   503     'CG34'          - Crouch-Grossman method of order 3(4)
%   504     'CG4a'          - Crouch-Grossman method of order 4
%   505     'CG5a'          - Crouch-Grossman method of order 5.
%                             From: jackiewicz1999cor.
%   506     'CG4test'       - Symmetric Crouch-Grossman method of
%                             order 4
%
%   Magnus type methods
%
%   600     'M4a'           - Magnus method of order 4
%   601     'M6a'           - Magnus method of order 6
%   602     'MRC3'          - Magnus method of order 3 based on
%                             relaxed collocation
%   603     'MRC4'          - Magnus method of order 4 based on
%                             relaxed collocation
%
%   Fer type methods
%
%   700     'fer2a'         - Fer method of order 2
%   701     'fer4G2'        - Fer method of order 4 based on
%                             Gaussian quadrature
%   702     'fer5GR'        - Fer method of order 5 based on
%                             Gauss-Radau quadrature
%   703     'fer6G3'        - Fer method of order 6 based on
%                             Gaussian quadrature
%   704     'fer6GLR'       - Fer method of order 6 based on
%                             Gaussian quadrature
%   705     'FRC3'          - Fer method of order 3 based on
%                             relaxed collocation
%   706     'FRC4'          - Fer method of order 4 based on
%                             relaxed collocation
%
%   Special kind of coefficients for particular methods
%
%   1000    'qq4a'          - Quadrature method for quadratic Lie
%                             groups. Order 4.
%   1001    'qq6a'          - Quadrature method for quadratic Lie
%                             groups. Order 6.
%   1002    'SE1'           - Partitioned Munthe-Kaas method. Based
%                             on the Euler coefficients. Order 1.
%   1003    'VER2'          - Partitioned Munthe-Kaas
%                             method. Based on the Euler
%                             coefficients. Order 2.
%   1004    'LobattoIII4'   - Partitioned Munthe-Kaas method. Based
%                             on the Lobatto III coefficients. Order 4.
%
% RESULT: 
%        This function updates the '.method' field of the object 'ts' to be
%        a MATLAB struct containing the following fields: 
%        
%        (tf.method) - 
%         .RKname - name of the method.
%         .RKa    - matrix A from the method's Butcher tableau.
%         .RKb    - vector b from the method's Butcher tableau.
%         .RKc    - vector c from the method's Butcher tableau or the
%                   abscissae values in case of Magnus methods.
%         .RKns   - number of stages in the method.
%         .RKord  - order of the method.
%         .RKtype - type of the method ('explicit', 'implicit', 'SDIRK')
%         .RKbhat - vector bhat from the method's Butcher tableau
%                   (used in error estimation).
%
%        More methods can easily be added by editing "setmethod.m"

% WRITTEN BY       : Arne Marthinsen, May 1997
% LAST MODIFIED BY : Kenth Engø-Monsen, 2012.04.24 

global DMARGCHK

name = inputname(1);
if DMARGCHK
  if isempty(name),
    error('First argument to set must be a named variable')
  end
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classical Runge-Kutta coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Explicit methods

if strcmp(method,'E1')|(method == 1),
  % Explicit Euler, order 1
  RKc = [0];
  RKa = [0];
  RKb = [1];
  RKbhat = [0];
  RKord = 1;
  RKns = 1;
  RKtype = 'explicit';
  RKname = 'E1';
elseif strcmp(method,'ME2')|(method == 2),
  % Modified Euler, order 2
  RKc = [0 1/2];
  RKa = [0           0
         1/2         0  ];
  RKb = [0 1];
  RKbhat = [0 0];
  RKord = 2;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'ME2';
elseif strcmp(method,'heun2')|(method == 3),
  % Heun's 2nd order method
  RKc = [0 1];
  RKa = [0           0
         1           0  ];
  RKb = [1/2 1/2];
  RKbhat = [0 0];
  RKord = 2;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'heun2';
elseif strcmp(method,'ode23')|(method == 4),
  % the method implemented in the MATLAB ode23 routine
  RKc = [0 1 1/2];
  RKa = [0           0           0
         1           0           0
         1/4         1/4         0  ];
  RKb = [1/6 1/6 2/3];
  RKbhat = [-1/6 -1/6 4/3];
  RKord = 2;
  RKns = 3;
  RKtype = 'explicit';
  RKname = 'ode23';
elseif strcmp(method,'moan25')|(method == 5),
  % Moan's method of order 2(5)
  RKc = [0 1/2 1];
  RKa = [0           0          0
         1/2         0          0
         0           1          0  ];
  RKb = [1/4 1/2 1/4];
  RKbhat = [0 0 0];
  RKord = 2;
  RKns = 3;
  RKtype = 'explicit';
  RKname = 'moan25';
elseif strcmp(method,'moan35')|(method == 6),
  % Moan's method of order 3(5)
  RKc = [0 1 2/3 1];
  RKa = [0           0          0          0
         1           0          0          0
         1/2       1/6          0          0
         -1/2     -3/2          3          0  ];
  RKb = [1/4 -1/12 3/4 1/12];
  RKbhat = [0 0 0 0];
  RKord = 3;
  RKns = 4;
  RKtype = 'explicit';
  RKname = 'moan35';
elseif strcmp(method,'RK4')|(method == 7),
  % "The" Runge-Kutta method, order 4
  RKc = [0 1/2 1/2 1];
  RKa = [0           0          0          0
         1/2         0          0          0
         0           1/2        0          0
         0           0          1          0  ];
  RKb = [1/6 1/3 1/3 1/6];
  RKbhat = [0 0 0 0];
  RKord = 4;
  RKns = 4;
  RKtype = 'explicit';
  RKname = 'RK4';
elseif strcmp(method,'rk45')|(method == 8),
  % Runge-Kutta method, order 4(5)
  RKc = [0 1/4 3/8 12/13 1 1/2];
  RKa = [0           0           0          0         0         0
         1/4         0           0          0         0         0
         3/32        9/32        0          0         0         0
         1932/2197   -7200/2197  7296/2197  0         0         0
         439/216     -8          3680/513   -845/4104 0         0
         -8/27       2           -3544/2565 1859/4104 -11/40    0  ];
  RKb = [25/216 0 1408/2565 2197/4104 -1/5 0];
  RKbhat = [16/135 0 6656/12825 28561/56430 -9/50 2/55];
  RKord = 4;
  RKns = 6;
  RKtype = 'explicit';
  RKname = 'rk45';
elseif strcmp(method,'RKF34')|(method == 9),
  % Fehlberg's method of order 3(4)
  RKc = [0 1/4 4/9 6/7 1];
  RKa = [0           0          0          0         0
         1/4         0          0          0         0
         4/81        32/81      0          0         0
         57/98      -432/343    1053/686   0         0
         1/6         0          27/52      49/156    0  ];
  RKb = [1/6 0 27/52 49/156 0];
  RKbhat = [43/288 0 243/416 343/1872 1/12];
  RKord = 3;
  RKns = 5;
  RKtype = 'explicit';
  RKname = 'RKF34';
elseif strcmp(method,'RKF43')|(method == 10),
  % Fehlberg's method of order 4(3)
  RKc = [0 1/4 4/9 6/7 1];
  RKa = [0           0          0          0         0
         1/4         0          0          0         0
         4/81        32/81      0          0         0
         57/98      -432/343    1053/686   0         0
         1/6         0          27/52      49/156    0  ];
  RKb = [43/288 0 243/416 343/1872 1/12];
  RKbhat = [1/6 0 27/52 49/156 0];
  RKord = 4;
  RKns = 5;
  RKtype = 'explicit';
  RKname = 'RKF43';
elseif strcmp(method,'RKF45a')|(method == 11),
  % Fehlberg's method of order 4(5) (a)
  RKc = [0 2/9 1/3 3/4 1 5/6];
  RKa = [0           0          0          0         0        0
         2/9         0          0          0         0        0
         1/12        1/4        0          0         0        0
         69/128     -243/128    135/64     0         0        0
        -17/12       27/4      -27/5       16/15     0        0
         65/432     -5/16       13/16      4/27      5/144    0  ];
  RKb = [1/9 0 9/20 16/45 1/12 0];
  RKbhat = [47/450 0 12/25 32/225 1/30 6/25];
  RKord = 4;
  RKns = 6;
  RKtype = 'explicit';
  RKname = 'RKF45a';
elseif strcmp(method,'RKF54a')|(method == 12),
  % Fehlberg's method of order 5(4) (a)
  RKc = [0 2/9 1/3 3/4 1 5/6];
  RKa = [0           0          0          0         0        0
         2/9         0          0          0         0        0
         1/12        1/4        0          0         0        0
         69/128     -243/128    135/64     0         0        0
        -17/12       27/4      -27/5       16/15     0        0
         65/432     -5/16       13/16      4/27      5/144    0  ];
  RKb = [47/450 0 12/25 32/225 1/30 6/25];
  RKbhat = [1/9 0 9/20 16/45 1/12 0];
  RKord = 5;
  RKns = 6;
  RKtype = 'explicit';
  RKname = 'RKF54a';
elseif strcmp(method,'RKF45b')|(method == 13),
  % Fehlberg's method of order 4(5) (b)
  RKc = [0 1/4 3/8 12/13 1 1/2];
  RKa = [0           0          0          0         0        0
         1/4         0          0          0         0        0
         3/32        9/32       0          0         0        0
         1932/2197  -7200/2197  7296/2197  0         0        0
         439/216    -8          3680/513  -845/4104  0        0
         -8/27       2         -3544/2565  1859/4104 -11/40   0  ];
  RKb = [25/216 0 1408/2565 2197/4104 -1/5 0];
  RKbhat = [16/135 0 6656/12825 28561/56430 -9/50 2/55];
  RKord = 4;
  RKns = 6;
  RKtype = 'explicit';
  RKname = 'RKF45b';
elseif strcmp(method,'RKF54b')|(method == 14),
  % Fehlberg's method of order 5(4) (b)
  RKc = [0 1/4 3/8 12/13 1 1/2];
  RKa = [0           0          0          0         0        0
         1/4         0          0          0         0        0
         3/32        9/32       0          0         0        0
         1932/2197  -7200/2197  7296/2197  0         0        0
         439/216    -8          3680/513  -845/4104  0        0
         -8/27       2         -3544/2565  1859/4104 -11/40   0  ];
  RKb = [16/135 0 6656/12825 28561/56430 -9/50 2/55];
  RKbhat = [25/216 0 1408/2565 2197/4104 -1/5 0];
  RKord = 5;
  RKns = 6;
  RKtype = 'explicit';
  RKname = 'RKF54b';
elseif strcmp(method,'dopri45')|(method == 15),
  % Dormand and Prince's method of order 4(5)
  RKc = [0 1/5 3/10 4/5 8/9 1 1];
  RKa = [0           0           0           0         0          0      0
         1/5         0           0           0         0          0      0
         3/40        9/40        0           0         0          0      0
         44/45      -56/15       32/9        0         0          0      0
         19372/6561 -25360/2187  64448/6561 -212/729   0          0      0
         9017/3168  -355/33      46732/5247  49/176   -5103/18656 0      0
         35/384      0           500/1113    125/192  -2187/6784  11/84  0  ];
  RKb = [5179/57600 0 7571/16695 393/640 -92097/339200 187/2100 1/40];
  RKbhat =  [35/384 0 500/1113 125/192 -2187/6784 11/84 0];
  RKord = 4;
  RKns = 7;
  RKtype = 'explicit';
  RKname = 'dopri45';
elseif strcmp(method,'dopri54')|(method == 16),
  % Dormand and Prince's method of order 5(4)
  RKc = [0 1/5 3/10 4/5 8/9 1 1];
  RKa = [0           0           0           0         0          0      0
         1/5         0           0           0         0          0      0
         3/40        9/40        0           0         0          0      0
         44/45      -56/15       32/9        0         0          0      0
         19372/6561 -25360/2187  64448/6561 -212/729   0          0      0
         9017/3168  -355/33      46732/5247  49/176   -5103/18656 0      0
         35/384      0           500/1113    125/192  -2187/6784  11/84  0  ];
  RKb =  [35/384 0 500/1113 125/192 -2187/6784 11/84 0];
  RKbhat = [5179/57600 0 7571/16695 393/640 -92097/339200 187/2100 1/40];
  RKord = 5;
  RKns = 7;
  RKtype = 'explicit';
  RKname = 'dopri54';
elseif strcmp(method,'butcher6')|(method == 17),
  % Butcher's 6th order method
  RKc = [0 1/2 2/3 1/3 5/6 1/6 1];
  RKa = [0           0          0          0         0        0      0
         1/2         0          0          0         0        0      0
         2/9         4/9        0          0         0        0      0
         7/36        2/9        -1/12      0         0        0      0
         -35/144     -55/36     35/48      15/8      0        0      0
         -1/360      -11/36     -1/8       1/2       1/10     0      0
         -41/260     22/13      43/156    -118/39    32/195   80/39  0  ];
  RKb = [13/200  0  11/40  11/40  4/25  4/25  13/200];
  RKbhat =  [0 0 0 0 0 0 0];
  RKord = 6;
  RKns = 7;
  RKtype = 'explicit';
  RKname = 'butcher6';
elseif strcmp(method,'RKF78')|(method == 18),
  % Fehlberg's method of order 7(8)
  RKc = [0 2/27 1/9 1/6 5/12 1/2 5/6 1/6 2/3 1/3 1 0 1];
  RKa = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         2/27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         1/36, 1/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         1/24, 0, 1/8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         5/12, 0, -25/16, 25/16, 0, 0, 0, 0, 0, 0, 0, 0, 0
         1/20, 0, 0, 1/4, 1/5, 0, 0, 0, 0, 0, 0, 0, 0
        -25/108, 0, 0, 125/108, -65/27, 125/54, 0, 0, 0, 0, 0, 0, 0
         31/300, 0, 0, 0, 61/225, -2/9, 13/900, 0, 0, 0, 0, 0, 0
         2, 0, 0, -53/6, 704/45, -107/9, 67/90, 3, 0, 0, 0, 0, 0
        -91/108, 0, 0, 23/108, -976/135, 311/54, -19/60, 17/6, -1/12, ...
             0, 0, 0, 0
        2383/4100, 0, 0, -341/164, 4496/1025, -301/82, 2133/4100, 45/82, ...
             45/164, 18/41, 0, 0, 0
        3/205, 0, 0, 0, 0, -6/41, -3/205, -3/41, 3/41, 6/41, 0, 0, 0
       -1777/4100, 0, 0, -341/164, 4496/1025, -289/82, 2193/4100, 51/82, ...
             33/164, 12/41, 0, 1, 0  ];
  RKb = [41/840, 0, 0, 0, 0, 34/105, 9/35, 9/35, 9/280, 9/280, 41/840, ...
             0, 0];
  RKbhat = [0, 0, 0, 0, 0, 34/105, 9/35, 9/35, 9/280, 9/280, 0, 41/840, ...
             41/840];
  RKord = 7;
  RKns = 13;
  RKtype = 'explicit';
  RKname = 'RKF78';
elseif strcmp(method,'RKF87')|(method == 19),
  % Fehlberg's method of order 8(7)
  RKc = [0 2/27 1/9 1/6 5/12 1/2 5/6 1/6 2/3 1/3 1 0 1];
  RKa = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         2/27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         1/36, 1/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         1/24, 0, 1/8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
         5/12, 0, -25/16, 25/16, 0, 0, 0, 0, 0, 0, 0, 0, 0
         1/20, 0, 0, 1/4, 1/5, 0, 0, 0, 0, 0, 0, 0, 0
        -25/108, 0, 0, 125/108, -65/27, 125/54, 0, 0, 0, 0, 0, 0, 0
         31/300, 0, 0, 0, 61/225, -2/9, 13/900, 0, 0, 0, 0, 0, 0
         2, 0, 0, -53/6, 704/45, -107/9, 67/90, 3, 0, 0, 0, 0, 0
        -91/108, 0, 0, 23/108, -976/135, 311/54, -19/60, 17/6, -1/12, ...
             0, 0, 0, 0
        2383/4100, 0, 0, -341/164, 4496/1025, -301/82, 2133/4100, 45/82, ...
             45/164, 18/41, 0, 0, 0
        3/205, 0, 0, 0, 0, -6/41, -3/205, -3/41, 3/41, 6/41, 0, 0, 0
       -1777/4100, 0, 0, -341/164, 4496/1025, -289/82, 2193/4100, 51/82, ...
             33/164, 12/41, 0, 1, 0  ];
  RKb = [0, 0, 0, 0, 0, 34/105, 9/35, 9/35, 9/280, 9/280, 0, 41/840, 41/840];
  RKbhat = [41/840, 0, 0, 0, 0, 34/105, 9/35, 9/35, 9/280, 9/280, ...
             41/840, 0, 0];
  RKord = 8;
  RKns = 13;
  RKtype = 'explicit';
  RKname = 'RKF87';
elseif strcmp(method,'dopri78')|(method == 20),
  % Dormand and Prince's method of order 7(8)
  RKc = [0 1/18 1/12 1/8 5/16 3/8 59/400 93/200 ...
        5490023248/9719169821 13/20 1201146811/1299019798 1 1];
  RKa = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         1/18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         1/48, 1/16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         1/32, 0, 3/32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         5/16, 0, -75/64, 75/64, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         3/80, 0, 0, 3/16, 3/20, 0, 0, 0, 0, 0, 0, 0, 0; 
         29443841/614563906, 0, 0, 77736538/692538347, ...
         -28693883/1125000000, 23124283/1800000000, 0, 0, 0, 0, 0, 0, 0;
         16016141/946692911, 0, 0, 61564180/158732637, 22789713/633445777, ...
         545815736/2771057229,  -180193667/1043307555, 0, 0, 0, 0, 0, 0 ;
         39632708/573591083, 0, 0, -433636366/683701615, ...
         -421739975/2616292301, 100302831/723423059, 790204164/839813087, ...
         800635310/3783071287, 0, 0, 0, 0, 0;
         246121993/1340847787, 0 0 -37695042795/15268766246, ...
         -309121744/1061227803, -12992083/490766935, 6005943493/2108947869, ...
         393006217/1396673457, 123872331/1001029789, 0, 0, 0, 0 ;
         -1028468189/846180014, 0, 0, 8478235783/508512852, ...
         1311729495/1432422823, -10304129995/1701304382, ...
         -48777925059/3047939560, 15336726248/1032824649, ...
         -45442868181/3398467696, 3065993473/597172653, 0, 0, 0;
         185892177/718116043, 0, 0, -3185094517/667107341, ...
         -477755414/1098053517, -703635378/230739211, ...
         5731566787/1027545527, 5232866602/850066563, ...
         -4093664535/808688257, 3962137247/1805957418, ...
         65686358/487910083, 0, 0;
         403863854/491063109, 0, 0, -5068492393/434740067, ...
         -411421997/543043805, 652783627/914296604, 11173962825/925320556, ...
         -13158990841/6184727034, 3936647629/1978049680, ...
         -160528059/685178525, 248638103/1413531060, 0, 0];
  RKb = [13451932/455176623 0 0 0 0 -808719846/976000145 ...
         1757004468/5645159321 656045339/265891186 ...
         -3867574721/1518517206 465885868/322736535 ...
         53011238/667516719 2/45 0];
  RKbhat = [14005451/335480064 0 0 0 0 -59238493/1068277825 ...
            181606767/758867731 561292985/797845732 -1041891430/1371343529 ...
            760417239/1151165299 118820643/751138087 -528747749/2220607170 ...
            1/4];
  RKord = 7;
  RKns = 13;
  RKtype = 'explicit';
  RKname = 'dopri78';
elseif strcmp(method,'dopri87')|(method == 21),
  % Dormand and Prince's method of order 8(7)
  RKc = [0 1/18 1/12 1/8 5/16 3/8 59/400 93/200 ...
        5490023248/9719169821 13/20 1201146811/1299019798 1 1];
  RKa = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         1/18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         1/48, 1/16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         1/32, 0, 3/32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         5/16, 0, -75/64, 75/64, 0, 0, 0, 0, 0, 0, 0, 0, 0;
         3/80, 0, 0, 3/16, 3/20, 0, 0, 0, 0, 0, 0, 0, 0; 
         29443841/614563906, 0, 0, 77736538/692538347, ...
         -28693883/1125000000, 23124283/1800000000, 0, 0, 0, 0, 0, 0, 0;
         16016141/946692911, 0, 0, 61564180/158732637, 22789713/633445777, ...
         545815736/2771057229,  -180193667/1043307555, 0, 0, 0, 0, 0, 0 ;
         39632708/573591083, 0, 0, -433636366/683701615, ...
         -421739975/2616292301, 100302831/723423059, 790204164/839813087, ...
         800635310/3783071287, 0, 0, 0, 0, 0;
         246121993/1340847787, 0 0 -37695042795/15268766246, ...
         -309121744/1061227803, -12992083/490766935, 6005943493/2108947869, ...
         393006217/1396673457, 123872331/1001029789, 0, 0, 0, 0 ;
         -1028468189/846180014, 0, 0, 8478235783/508512852, ...
         1311729495/1432422823, -10304129995/1701304382, ...
         -48777925059/3047939560, 15336726248/1032824649, ...
         -45442868181/3398467696, 3065993473/597172653, 0, 0, 0;
         185892177/718116043, 0, 0, -3185094517/667107341, ...
         -477755414/1098053517, -703635378/230739211, ...
         5731566787/1027545527, 5232866602/850066563, ...
         -4093664535/808688257, 3962137247/1805957418, ...
         65686358/487910083, 0, 0;
         403863854/491063109, 0, 0, -5068492393/434740067, ...
         -411421997/543043805, 652783627/914296604, 11173962825/925320556, ...
         -13158990841/6184727034, 3936647629/1978049680, ...
         -160528059/685178525, 248638103/1413531060, 0, 0];
  RKb = [14005451/335480064 0 0 0 0 -59238493/1068277825 ...
        181606767/758867731 561292985/797845732 -1041891430/1371343529 ...
        760417239/1151165299 118820643/751138087 -528747749/2220607170 1/4];
  RKbhat = [13451932/455176623 0 0 0 0 -808719846/976000145 ...
            1757004468/5645159321 656045339/265891186 ...
            -3867574721/1518517206 465885868/322736535 ...
            53011238/667516719 2/45 0];
  RKord = 8;
  RKns = 13;
  RKtype = 'explicit';
  RKname = 'dopri87';

% Implicit methods

elseif strcmp(method,'IE1')|(method == 300),
  % Implicit Euler, order 1
  RKc = [1];
  RKa = [1];
  RKb = [1];
  RKbhat = [0];
  RKord = 1;
  RKns = 1;
  RKtype = 'implicit';
  RKname = 'IE1';
elseif (strcmp(method,'GL2')|strcmp(method,'IM2')|(method == 301)),
  % Gauss-Legendre/implicit midpoint of order 2
  RKc = [1/2];
  RKa = [1/2];
  RKb = [1];
  RKbhat = [0];
  RKord = 2;
  RKns = 1;
  RKtype = 'implicit';
  RKname = 'GL2';
elseif strcmp(method,'GL4')|(method == 302),
  % Gauss-Legendre method of order 4
  RKc = [(3-sqrt(3))/6 (3+sqrt(3))/6];
  RKa = [       1/4       (3-2*sqrt(3))/12;
         (3+2*sqrt(3))/12        1/4  ];
  RKb = [1/2 1/2];
  RKbhat = [0 0];
  RKord = 4;
  RKns = 2;
  RKtype = 'implicit';
  RKname = 'GL4';
elseif strcmp(method,'GL6')|(method == 303),
  % Gauss-Legendre method of order 6
  RKc = [(5-sqrt(15))/10 1/2 (5+sqrt(15))/10];
  RKa = [       5/36         (10-3*sqrt(15))/45 (25-6*sqrt(15))/180;
         (10+3*sqrt(15))/72       2/9           (10-3*sqrt(15))/72;
         (25+6*sqrt(15))/180 (10+3*sqrt(15))/45       5/36  ];
  RKb = [5/18 4/9 5/18];
  RKbhat = [0 0 0];
  RKord = 6;
  RKns = 3;
  RKtype = 'implicit';
  RKname = 'GL6';
elseif strcmp(method,'TRAP2')|(method == 304),
  % Trapozoidal rule, second order. (This is also a Lobatto IIIA method.)
  RKc = [0 1];
  RKa = [0 0; 1/2 1/2];
  RKb = [1/2 1/2];
  RKbhat = [];
  RKord = 2;
  RKns = 2;
  RKtype = 'implicit';
  RKname = 'TRAP2';
elseif strcmp(method,'GL4S')|(method == 305),
  % Time symmetric Gauss-Legendre method of order 4.
  RKc = [1/2-sqrt(3)/6, 1/2 + sqrt(3)/6];
  RKa = [1/4,           1/4-sqrt(3)/6;
         1/4+sqrt(3)/6,  1/4];
  RKb = [1/2 1/2];
  RKbhat = [0 0];
  RKord = 4;
  RKns = 2;
  RKtype = 'implicit';
  RKname = 'GL4S';
elseif strcmp(method,'GL6S')|(method == 306),
  % Time symmetric Gauss-Legendre method of order 6.
  RKc = [1/2-sqrt(15)/10,    1/2,    1/2+sqrt(15)/10 ];
  RKa = [5/36,      2/9-sqrt(15)/15,    5/36-sqrt(15)/30;
	 5/36+sqrt(15)/24,   2/9,    5/36-sqrt(15)/24;
	 5/36+sqrt(15)/30,  2/9+sqrt(15)/15,  5/36];
  RKb = [5/18 4/9 5/18];
  RKbhat = [0 0 0];
  RKord = 6;
  RKns = 3;
  RKtype = 'implicit';
  RKname = 'GL6S';
elseif strcmp(method,'LobattoIIIA4')|(method == 307),
  % Lobatto IIIA method of order 4
  RKc = [0 1/2 1];
  RKa = [0 0 0; 5/24 1/3 -1/24; 1/6 2/3 1/6];
  RKb = [1/6 2/3 1/6];
  RKbhat = [];
  RKord = 4;
  RKns = 3;
  RKtype = 'implicit';
  RKname = 'LobattoIIIA4';
elseif strcmp(method,'LobattoIIIA6')|(method == 308),
  % Lobatto IIIA method of order 6
  var = sqrt(5);
  RKc = [0 (5-var)/10 (5+var)/10 1];
  RKa = [0 0 0 0;
         (11+var)/120 (25-var)/120 (25-13*var)/120 (-1+var)/120;
         (11-var)/120 (25+13*var)/120 (25+var)/120 (-1-var)/120;
         1/12 5/12 5/12 1/12];
  RKb = [1/12 5/12 5/12 1/12];
  RKbhat = [];
  RKord = 6;
  RKns = 4;
  RKtype = 'implicit';
  RKname = 'LobattoIIIA6';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crouch-Grossman methods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elseif strcmp(method,'CG23')|(method == 500),
  % Crouch-Grossman method of order 2(3)
  RKc = [0 3/4 17/24];
  RKa = [0           0           0
         3/4         0           0
         119/216     17/108      0  ];
  RKb = [17/54 19/54 1/3];
  RKbhat = [13/51 -2/3 24/17];
  RKord = 2;
  RKns = 3;
  RKtype = 'explicit';
  RKname = 'CG23';
elseif strcmp(method,'CG3a')|(method == 501),
  % Crouch-Grossman method of order 3
  RKc = [0 3/4 17/24];
  RKa = [0           0           0
         3/4         0           0
         119/216     17/108      0  ];
  RKb = [13/51 -2/3 24/17];
  RKbhat = [0 0 0];
  RKord = 3;
  RKns = 3;
  RKtype = 'explicit';
  RKname = 'CG3a';
elseif strcmp(method,'CG43')|(method == 502),
  % Crouch-Grossman method of order 4(3)
  T=2^(1/3);
  theta=1/18*(1+T+T^2+sqrt(105+88*T+71*T^2));
  t1=1+T+T^2;
  t2=T+T^2;
  t3=2*T+T^2;
  t4=4+3*T+2*T^2;

  RKc = [0 3/2 1/3*T+1/6*T^2+2/3 -1/3*T-1/6*T^2+1/3 1];
  RKa=zeros([5,5]);
  RKa(2,1)=RKc(2);
  RKa(3,2)=1/18*t4;
  RKa(3,1)=RKc(3)-RKa(3,2);
  RKa(4,2)=t1*theta-1/18*t4;
  RKa(4,3)=(-9*t1*theta+3+t2)/(4+t3);
  RKa(4,1)=RKc(4)-RKa(4,2)-RKa(4,3);
  RKa(5,2)=theta;
  RKa(5,3)=(-9*t1*theta+3+2*t2)/(10+8*T+7*T^2);
  RKa(5,4)=-t2/(4+t3);
  RKa(5,1)=RKc(5)-RKa(5,2)-RKa(5,3)-RKa(5,4);

  RKb = [1/2*t1/t2 0 -1/6*(1+t3)/(2+t2) -1/2/t2 1/2*t1/t2];

  t5=1/4*(800*T+635*T^2+1008)/(373+235*T^2+296*T);
  t6=-1/2*(400*T^2+504*T+635)/((373+235*T^2+296*T)*(t2+2));

  RKbhat = [t5 0 t6 t6 t5];
  RKord = 4;
  RKns = 5;
  RKtype = 'explicit';
  RKname = 'CG43';
elseif strcmp(method,'CG34')|(method == 503),
  % Crouch-Grossman method of order 3(4)
  T=2^(1/3);
  theta=1/18*(1+T+T^2+sqrt(105+88*T+71*T^2));
  t1=1+T+T^2;
  t2=T+T^2;
  t3=2*T+T^2;
  t4=4+3*T+2*T^2;

  RKc = [0 3/2 1/3*T+1/6*T^2+2/3 -1/3*T-1/6*T^2+1/3 1];
  RKa=zeros([5,5]);
  RKa(2,1)=RKc(2);
  RKa(3,2)=1/18*t4;
  RKa(3,1)=RKc(3)-RKa(3,2);
  RKa(4,2)=t1*theta-1/18*t4;
  RKa(4,3)=(-9*t1*theta+3+t2)/(4+t3);
  RKa(4,1)=RKc(4)-RKa(4,2)-RKa(4,3);
  RKa(5,2)=theta;
  RKa(5,3)=(-9*t1*theta+3+2*t2)/(10+8*T+7*T^2);
  RKa(5,4)=-t2/(4+t3);
  RKa(5,1)=RKc(5)-RKa(5,2)-RKa(5,3)-RKa(5,4);

  t5=1/4*(800*T+635*T^2+1008)/(373+235*T^2+296*T);
  t6=-1/2*(400*T^2+504*T+635)/((373+235*T^2+296*T)*(t2+2));

  RKb = [t5 0 t6 t6 t5];
  RKbhat = [1/2*t1/t2 0 -1/6*(1+t3)/(2+t2) -1/2/t2 1/2*t1/t2];
  RKord = 3;
  RKns = 5;
  RKtype = 'explicit';
  RKname = 'CG34';
elseif strcmp(method,'CG4a')|(method == 504),
  % Crouch-Grossman method of order 4a
  RKc = [0.0 0.8177227988124852 0.3859740639032449 0.3242290522866937 0.8768903263420429];
  RKa = zeros([5,5]);
  RKa(2,1) = 0.8177227988124852; RKa(3,1) = 0.3199876375476427;
  RKa(3,2) = 0.0659864263556022; RKa(4,1) = 0.9214417194464946;
  RKa(4,2) = 0.4997857776773573; RKa(4,3) = -1.0969984448371582;
  RKa(5,1) = 0.3552358559023322; RKa(5,2) = 0.2390958372307326;
  RKa(5,3) = 1.3918565724203246; RKa(5,4) = -1.1092979392113465;
  RKb = [0.1370831520630755 -0.0183698531564020 0.7397813985370780 -0.1907142565505889 0.3322195591068374];
  RKbhat = [0 0 0 0 0];
  RKord = 4;
  RKns = 5;
  RKtype = 'explicit';
  RKname = 'CG4a';
elseif strcmp(method,'CG5a')|(method == 505),
  % Crouch-Grossman method of order 5. From: jackiewicz1999cor.
  RKord  = 5;
  RKns   = 9;
  RKname = 'CG5a';
  RKtype = 'explicit';
  RKa    = zeros(RKns);
  RKb    = zeros(1,RKns);
  RKbhat = RKb;
  RKc    = RKb;
  RKa(2,1) =  0.5119828014137712; RKa(3,1) =  0.1256672120643583;
  RKa(3,2) =  0.7516202380829815; RKa(4,1) = -0.1859318985660963;
  RKa(4,2) =  0.9805295406563367; RKa(4,3) = -0.5333302514616872;
  RKa(5,1) =  0.1693767277911736; RKa(5,2) =  0.9505578305836004;
  RKa(5,3) = -0.2601241719456298; RKa(5,4) = -0.2298819100175240;
  RKa(6,1) = -0.3672779810475256; RKa(6,2) = -0.0086029950554851;
  RKa(6,3) = -0.0010336337263253; RKa(6,4) =  0.4747844514543335;
  RKa(6,5) = -0.1827675787966842; RKa(7,1) = -0.1967584902954152;
  RKa(7,2) = -0.0841805485664162; RKa(7,3) = -0.0269530236366960;
  RKa(7,4) =  0.7559747536983863; RKa(7,5) = -0.0238706198984107;
  RKa(7,6) =  0.0482925299135956; RKa(8,1) = -0.5309452158934434;
  RKa(8,2) =  0.0197456651284920; RKa(8,3) = -0.0890782597312347;
  RKa(8,4) =  1.1112114193183167; RKa(8,5) = -0.2549231869664070;
  RKa(8,6) =  0.0690881269948897; RKa(8,7) = -0.0190658555145840;
  RKa(9,1) =  0.0;                RKa(9,2) = -0.1116041993954347;
  RKa(9,3) =  0.0007837329078394; RKa(9,4) =  0.1273989332794543;
  RKa(9,5) = -0.2951798037735399; RKa(9,6) = -0.5806798044068681;
  RKa(9,7) = -0.3715982236980106; RKa(9,8) =  1.1170906343009428;
  RKb(1)   =  0.7927513978455029; RKc(1)   =  0.0;
  RKb(2)   =  0.0;                RKc(2)   =  0.5119828014137712;
  RKb(3)   =  0.3490698579749237; RKc(3)   =  0.8772874501473397;
  RKb(4)   =  0.3139686995007973; RKc(4)   =  0.2612673906285532;
  RKb(5)   = -0.4266876632081064; RKc(5)   =  0.6299284764116202;
  RKb(6)   = -0.8094238190622946; RKc(6)   = -0.0848977371716866;
  RKb(7)   =  1.3450516465346317; RKc(7)   =  0.4725046012150439;
  RKb(8)   = -0.9242094915998407; RKc(8)   =  0.3060326933360294;
  RKb(9)   =  0.3594793720143862; RKc(9)   = -0.1137887307856168;
elseif strcmp(method,'CG4test')|(method == 506),
  % Symmetric Crouch-Grossman method of order 4
  RKc = [0 3/8 17/48 31/48 5/8 1 5/8 31/48];
  RKa = [0 0 0 0 0 0 0 0      
     3/8      0      0      0       0       0      0 0 
   119/432  17/216   0      0       0       0      0 0  
    13/102  -1/3   12/17  12/17   -1/3  -443/2993  -17/216 0
    13/102  -1/3   12/17  12/17   -1/3  -101/408   0 0 
    13/102  -1/3   12/17  12/17   -1/3    13/102   0 0 
    13/102  -1/3   12/17  12/17   -1/3  -101/408   0 0 
    13/102  -1/3   12/17  12/17   -1/3  -443/2993  -17/216 0];
  RKb = [13/102 -1/3 12/17 12/17 -1/3 13/102 0 0];
  RKbhat = [0 0 0 0 0 0 0 0];
  RKord = 4;
  RKns = 8;
  RKtype = 'implicit';
  RKname = 'CG4test';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Magnus type methods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elseif strcmp(method,'M4a')|(method == 600),
  % Magnus method of order 4
  RKc = [1/2-sqrt(3)/6 1/2+sqrt(3)/6];
  RKa = [0];
  RKb = [0];
  RKbhat = [0];
  RKord = 4;
  RKns = length(RKc);
  RKtype = 'explicit';
  RKname = 'M4a';
elseif strcmp(method,'M6a')|(method == 601),
  % Magnus method of order 6
  RKc = [1/2-sqrt(15)/10 1/2 1/2+sqrt(15)/10];
  RKa = [0];
  RKb = [0];
  RKbhat = [0];
  RKord = 6;
  RKns = length(RKc);
  RKtype = 'explicit';
  RKname = 'M6a';
elseif strcmp(method,'MRC3')|(method == 602),
  % Magnus method of order 3 based on relaxed collocation
  RKc = [];
  RKa = [];
  RKb = [];
  RKbhat = [];
  RKord = 3;
  RKns = 1;
  RKtype = 'explicit';
  RKname = 'MRC3';
elseif strcmp(method,'MC4')|(method == 603),
  % Magnus method of order 4 based on collocation
  RKc = [1/2-sqrt(3)/6 1/2+sqrt(3)/6];
  RKa = [];
  RKb = [];
  RKbhat = [];
  RKord = 4;
  RKns = 1;
  RKtype = 'implicit';
  RKname = 'MC4';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fer type methods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elseif strcmp(method,'fer2a')|(method == 700),
  % Fer method of order 2
  RKc = [0 1];
  RKa = [2];
  RKb = [1/2 1/2];
  RKbhat = [0];
  RKord = 2;
  RKns = 1;
  RKtype = 'explicit';
  RKname = 'fer2a';
elseif strcmp(method,'fer4G2')|(method == 701),
  % Fer method of order 4 based on Gaussian quadrature
  RKc = [1/2-sqrt(3)/6 1/2+sqrt(3)/6 1/2-sqrt(3)/6 1/2+sqrt(3)/6];
  RKa = [2 2];
  RKb = [1/2 1/2 1/2 1/2];
  RKbhat = [0];
  RKord = 4;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'fer4G2';
elseif strcmp(method,'fer5GR')|(method == 702),
  % Fer method of order 5 based on Gauss-Radau quadrature
  RKc = [1/2-sqrt(3)/6 1/2+sqrt(3)/6 3/5 1];
  RKa = [2 2];
  RKb = [1/2 1/2 125/216 1/8];
  RKbhat = [0];
  RKord = 4;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'fer5GR';
elseif strcmp(method,'fer6G3')|(method == 703),
  % Fer method of order 6 based on Gaussian quadrature
  RKc = [1/2-sqrt(15)/10 1/2 1/2+sqrt(15)/10 (4-sqrt(2))/7 (4+sqrt(2))/7 1];
  RKa = [3 3];
  RKb = [5/18 4/9 5/18 (184+11*sqrt(2))/480 (184-11*sqrt(2))/480 1/15];
  RKbhat = [0];
  RKord = 6;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'fer6G3';
elseif strcmp(method,'fer6GLR')|(method == 704),
  % Fer method of order 6 based on Gaussian quadrature
  % (Gauss-Legendre and Gauss-Jacobi-Radau)
  RKc = [(1-sqrt((15+2*sqrt(30))/35))/2 (1-sqrt((15-2*sqrt(30))/35))/2 ...
	(1+sqrt((15-2*sqrt(30))/35))/2 (1+sqrt((15+2*sqrt(30))/35))/2 ...
	(4-sqrt(2))/7 (4+sqrt(2))/7 1];
  RKa = [4 3];
  RKb = [(18-sqrt(30))/72 (18+sqrt(30))/72 (18+sqrt(30))/72 ...
	(18-sqrt(30))/72 (184+11*sqrt(2))/480 (184-11*sqrt(2))/480 ...
	1/15];
  RKbhat = [0];
  RKord = 6;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'fer6GLR';
elseif strcmp(method,'FRC3')|(method == 705),
  % Fer method of order 3 based on relaxed collocation
  RKc = [];
  RKa = [];
  RKb = [];
  RKbhat = [];
  RKord = 3;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'FRC3';
elseif strcmp(method,'FC4')|(method == 706),
  % Fer method of order 4 based on collocation
  RKc = [0 1/2 1];
  RKa = [];
  RKb = [];
  RKbhat = [];
  RKord = 4;
  RKns = 2;
  RKtype = 'implicit';
  RKname = 'FC4';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special kind of coefficients for particular methods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elseif strcmp(method,'qq4a')|(method == 1000),
  % Quadrature method for quadratic Lie groups. Order 4.
  RKc = [1/2-sqrt(3)/6 1/2+sqrt(3)/6];
  RKa = [];
  RKb = [];
  RKbhat = [];
  RKord = 4;
  RKns = 2;
  RKtype = 'explicit';
  RKname = 'qq4a';
elseif strcmp(method,'qq6a')|(method == 1001),
  % Quadrature method for quadratic Lie groups. Order 6.
  RKc = [1/2-sqrt(15)/10 1/2 1/2+sqrt(15)/10];
  RKa = [];
  RKb = [];
  RKbhat = [];
  RKord = 6;
  RKns = 3;
  RKtype = 'explicit';
  RKname = 'qq6a';
elseif strcmp(method,'SE1')|(method == 1002),
  % Implicit Euler
  PRKa    = [1];
  PRKb    = [1];
  PRKc    = [1];
  % Explicit Euler
  PRKat   = [0];
  PRKbt   = [1];
  PRKct   = [0];
  PRKord  = 1;
  PRKns   = 1;
  PRKtype = {'implicit' 'explicit'};
  PRKname = 'SE1';
elseif strcmp(method,'VER2')|(method == 1003),
  PRKa    = [0 0; 1/2 1/2];
  PRKb    = [1/2 1/2];
  PRKc    = [0; 1];
  PRKat   = [1/2 0; 1/2 0];
  PRKbt   = [1/2 1/2];
  PRKct   = [1/2; 1/2];
  PRKord  = 2;
  PRKns   = 2;
  PRKtype = {'implicit' 'implicit'};
  PRKname = 'VER2';
elseif strcmp(method,'LobattoIII4')|(method == 1004),
  PRKa    = [0 0 0; 5/24 1/3 -1/24; 1/6 2/3 1/6];
  PRKb    = [1/6 2/3 1/6];
  PRKc    = [0; 1/2; 1];
  PRKat   = [1/6 -1/6 0; 1/6 1/3 0; 1/6 5/6 0];
  PRKbt   = [1/6 2/3 1/6];
  PRKct   = [0; 1/2; 1];
  PRKord  = 4;
  PRKns   = 3;
  PRKtype = {'implicit' 'implicit'};
  PRKname = 'LobattoIII4';
else,
  if ischar(method),
    error(['The method ' method ' is unknown.' ...
	  ' You can put the method coefficients in "setmethod.m"']); 
  elseif dmisinteger(method),
    error(['The method with number ' int2str(method) ' is unknown.' ...
	  ' You can put the method coefficients in "setmethod.m"']); 
  end;
end;

if exist('PRKname','var'),
  meth.PRKname = PRKname;
  meth.PRKa    = PRKa;
  meth.PRKb    = PRKb;
  meth.PRKc    = PRKc;
  meth.PRKat   = PRKat;
  meth.PRKbt   = PRKbt;
  meth.PRKct   = PRKct;
  meth.PRKns   = PRKns;
  meth.PRKord  = PRKord;
  meth.PRKtype = PRKtype;
else
  meth.RKname = RKname;
  meth.RKa    = RKa;
  meth.RKb    = RKb;
  meth.RKc    = RKc;
  meth.RKns   = RKns;
  meth.RKord  = RKord;
  meth.RKtype = RKtype;
  meth.RKbhat = RKbhat;
end;

ts.method = meth;

assignin('caller',name,ts);
return;
