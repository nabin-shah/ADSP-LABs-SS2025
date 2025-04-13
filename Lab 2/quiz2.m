% Parameters
L = 1e-3;     % 1 mH
C = 10e-9;    % 10 nF

% Transfer function
num = [1];
den = [L*C 0 1]; %s^2+s+1
H = tf(num, den);

% Original frequency vector in rad/s (logarithmic spacing)
w = logspace(4, 7, 100);  % Frequency from 10^4 rad/s to 10^7 rad/s

% Frequency around the expected peak (add more points around this range)
peak_freq = 1e6;  % Approximate peak frequency (can adjust based on the expected behavior)
w_fine = logspace(log10(peak_freq) - 1, log10(peak_freq) + 1, 100);  % More resolution around the peak

% Combine the original frequency range with the finer range around the peak
w_combined = unique(sort([w, w_fine]));  % Combine and remove duplicates

% Create Bode plot with custom frequency vector
[mag, phase, wout] = bode(H, w_combined);

% Plot magnitude
subplot(2,1,1);
semilogx(wout, 20*log10(squeeze(mag)));  % Convert magnitude to dB
grid on;
title('Frequency Response of Series LC Circuit');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
xlim([min(wout) max(wout)]);  % Custom x-axis limits
ylim([-60 40]);  % Set y-axis limits for magnitude
set(gca, 'YTick', -60:20:40);

% Plot phase
subplot(2,1,2);
semilogx(wout, squeeze(phase));  % Phase in degrees
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');
xlim([min(wout) max(wout)]);  % Custom x-axis limits
ylim([0 150]);  % Set y-axis limits for phase
set(gca, 'YTick', 0:50:150);
