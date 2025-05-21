%=================================================================
% Bode Plot for 1st-Order High-Shelf Filter (R=1kΩ, C=0.01µF)
%=================================================================
clearvars; close all; clc;

% Filter parameters
R       = 1e3;           % ohm
C       = 0.01e-6;       % farad
G_low   = 1;             % low-frequency gain
G_high  = 2;             % high-frequency gain

% Time constant and corner
tau     = R * C;                     % s
w0      = 1 / tau;                   % rad/s
f0      = w0 / (2*pi);               % Hz

fprintf('Shelf corner f0 = %.2f kHz\n', f0/1e3);
fprintf('Low-freq gain = %.2f (%.2f dB)\n',    G_low,  20*log10(G_low));
fprintf('High-freq gain = %.2f (%.2f dB)\n\n', G_high, 20*log10(G_high));

% Transfer function of high-shelf:
%   H(s) = [ (G_high–G_low)*tau * s + G_low ] / [ tau * s + 1 ]
num = [ (G_high - G_low)*tau,  G_low ];
den = [      tau,               1    ];
sys = tf(num, den);

% Bode plot
figure;
bode(sys, {w0/100, w0*1000});   % sweep from two decades below to three above
grid on;
title('Bode Plot: 1^{st}-Order High-Shelf (R=1k, C=0.01μF)');
legend(sprintf('f_0=%.1f kHz', f0/1e3), 'Location','SouthWest');