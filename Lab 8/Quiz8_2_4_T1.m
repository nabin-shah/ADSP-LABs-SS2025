%=================================================================
% Compare Ideal vs. Real-OP27 High-Shelf Filter
%=================================================================
clearvars; close all; clc;

% Filter component values
R  = 470;          % ohm
C  = 0.01e-6;      % farad
G_low  = 1;        % low-freq gain
G_high = 2;        % high-freq gain

% Compute shelf corner
tau = R*C;                  % time constant
w0  = 1/tau;                % rad/s
f0  = w0/(2*pi);            % Hz

fprintf('Shelf corner f0 = %.2f kHz\n', f0/1e3);
fprintf('Low-freq gain = %.2f (%.2f dB)\n', G_low, 20*log10(G_low));
fprintf('High-freq gain = %.2f (%.2f dB)\n\n', G_high, 20*log10(G_high));

%-----------------------------------------------------------------
% 1) Ideal-op-amp transfer function H_ideal(s)
%    H(s) = (G_low + (G_high-G_low)*(s*tau)) / (1 + s*tau)
%-----------------------------------------------------------------
num_ideal = [ (G_high-G_low)*tau,  G_low ];
den_ideal = [     tau,              1     ];
sys_ideal = tf(num_ideal, den_ideal);

%-----------------------------------------------------------------
% 2) Real OP27 model: single-pole open-loop Aol(s) around same network
%    Aol(s) = A0 / (1 + s/p),  with p = 2*pi*GBW/A0
%    Close loop: sys_real = feedback(Aol * G_passive, 1)
%    G_passive is the same 1/(1+s*tau) shape scaled to shelving form
%-----------------------------------------------------------------
A0  = 1e5;          % OP27 DC open-loop gain (~100 dB)
GBW = 8e6;          % OP27 gain-bandwidth product (Hz)
p   = 2*pi*GBW/A0;  % single-pole frequency (rad/s)
Aol = tf(A0, [1, p]);

% Build the passive network in the feedback path.  We want
%     Closed-loop: Vout/Vin = Aol(s) / (1 + Aol(s)*Beta(s)),
% where Beta(s) is the feedback function that yields the ideal shelving.
% For a non-inverting high-shelf the loop equation yields the same
% numerator/den denominator as sys_ideal.
G_passive = tf(num_ideal, den_ideal) / G_low;  
% (we divide by G_low so that the ideal closed-loop gain = G_low * (Aol/(1+Aol*Beta)) 
%  matches sys_ideal exactly when Aol>>1)

% Close the loop with unity feedback
sys_real = feedback( Aol * G_passive, 1 ) * G_low;

%-----------------------------------------------------------------
% 3) Bode plot comparison
%-----------------------------------------------------------------
w = logspace(log10(w0)-2, log10(w0)+3, 2000);  % sweep 2 decades below → 3 above w0

[mag_id, ~] = bode(sys_ideal, w);
[mag_re, ~] = bode(sys_real,  w);
mag_id_dB   = squeeze(20*log10(mag_id));
mag_re_dB   = squeeze(20*log10(mag_re));

figure(1)
semilogx(w./(2*pi), mag_id_dB, 'b--', 'LineWidth',1.5)
hold on
semilogx(w./(2*pi), mag_re_dB, 'r',  'LineWidth',1.5)
grid on
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
legend('Ideal op-amp','Real OP27','Location','SouthWest')
title('High-Shelf Filter: Ideal vs. Real OP27')

%-----------------------------------------------------------------
% 4) Find where difference first exceeds 0.1 dB
%-----------------------------------------------------------------
delta = abs(mag_re_dB - mag_id_dB);
idx   = find(delta > 0.1, 1, 'first');
f_break = w(idx)/(2*pi);

fprintf('Ideal-op-amp valid up to ≈ %.2f kHz  (Δ > 0.1 dB beyond)\n', f_break/1e3);