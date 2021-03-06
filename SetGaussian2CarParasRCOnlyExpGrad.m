Coupled = 1;
TwoCarriers = 1;
RC = 1;

nx = 201;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

a = 16;                                 % From 1x10^16
b = (log(20) + 16*log(10))/(log(10));   % To 20x10^16

F = logspace(a,b,201);
FX = gradient(F);

Nd = FX .* 1e6;
%Nd = 1e16 * 1e6; % Const. 1/cm3 (100 cm/m)^3
NetDoping = ones(1,nx).*Nd; % doping

x0 = l/2;
nw = l/20;
npDisturbance = 1e16*1e6*exp(-((x-x0)/nw).^2);

LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

% PlotYAxis = {[-1e-15 2e-15] [-2e-9 2e-9] [-1.5e-12 1.5e-12]...
%     [1e22 2e22] [0 1e22] [0 20e43]...
%     [-20e33 15e33] [-2.5e34 2e34] [-1.1e8 1.1e8] ...
%     [-1e8 1e8] [-10e-3 10e-3] [0 2e22]};
%PlotYaxis = {[0 1.5e-16] [-10e-10 5e-10] [-6e-6 6e-6]...
%     [0e21 3e21] [6e20 12e20] [1e42 3e42]...
%     [-4e31 4e31] [-4e31 4e31] [-1e6 1e6]...
%     [-1e6 1e6] [-0.015 0.015] [0e21 12e21]};

doPlotImage = 0;
PlotFile = 'Gau2CarRCExpGrad.gif';