%=================================================================
% Compare Ideal vs. Real OP27 for the 1k–0.01µF Shelf Filter
%=================================================================
clearvars; close all; clc;

% Filter parameters
R      = 1e3;           % ohm
C      = 0.01e-6;       % farad
tau    = R*C;           % time constant (s)
w0     = 1/tau;         % rad/s
f0     = w0/(2*pi);     % Hz

G_low  = 1;             % low-frequency gain (0 dB)
G_high = 2;             % high-frequency gain (6 dB)

fprintf('Shelf corner f0 = %.2f kHz\n', f0/1e3);

%=== 1) Ideal-op-amp transfer H_ideal(s) ===
% H(s) = [ (G_high-G_low)*tau*s + G_low ] / [ tau*s + 1 ]
num_ideal = [ (G_high-G_low)*tau,  G_low ];
den_ideal = [      tau,             1    ];
sys_ideal = tf(num_ideal, den_ideal);

%=== 2) Real OP27 model ===
A0  = 1e5;           % DC open-loop gain ≃100 dB
GBW = 8e6;           % Gain-bandwidth product (Hz)
p   = 2*pi*GBW/A0;   % open-loop pole, rad/s
Aol = tf(A0, [1, p]);

% We want the same closed-loop H_ideal = G_low * Aol/(1 + Aol*Beta)
% Solve for Beta(s):  H_ideal = G_low * 1/(1 + 1/(Aol*Beta))
% => (1 + Aol*Beta) = G_low * Aol/Beta  … lengthy but effectively
% we can embed the passive network directly:
G_passive = tf(num_ideal, den_ideal)/G_low;

sys_real = feedback(Aol * G_passive, 1) * G_low;

%=== 3) Bode-plot comparison ===
w = logspace(log10(w0)-2, log10(w0)+3, 2000);  % rad/s sweep

[mag_id, ~] = bode(sys_ideal, w);
[mag_re, ~] = bode(sys_real,  w);
mag_id_dB   = squeeze(20*log10(mag_id));
mag_re_dB   = squeeze(20*log10(mag_re));

figure;
semilogx(w/(2*pi), mag_id_dB, 'b--', 'LineWidth',1.5); hold on
semilogx(w/(2*pi), mag_re_dB, 'r',  'LineWidth',1.5);
grid on
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
legend('Ideal op-amp','Real OP27','Location','SouthWest')
title('Ideal vs. Real‐OP27 High‐Shelf Filter')

%=== 4) Find break‐point where |Δmag|>0.1 dB ===
delta = abs(mag_re_dB - mag_id_dB);
idx   = find(delta > 0.1, 1, 'first');
f_break = w(idx)/(2*pi);

fprintf('Ideal‐op‐amp model valid up to ≈ %.2f kHz (Δmag ≤ 0.1 dB)\n', f_break/1e3);