% Define component values
L = 0.001;    % Inductance in Henry (1 mH)
C = 1e-8;     % Capacitance in Farad (0.01 µF)
Rs = 68;      % Series resistance in Ohms (68 Ω as per Graph B)

% Define the transfer function for v_L / V_in
s = tf('s');
H = (L * s) / (Rs * L * C * s^2 + L * s + Rs);  % Transfer function with R = ∞

% Generate frequency vector using logspace
freq_rad = logspace(4, 7, 1000);  % From 10^4 to 10^7 rad/s, 1000 points

% Compute frequency response
[mag, phase] = bode(H, freq_rad);

% Convert to dB and degrees
mag_dB = squeeze(mag);         % Magnitude in linear scale
phase_deg = squeeze(phase);    % Phase in degrees

% Plot magnitude response
figure;
subplot(2,1,1);
semilogx(freq_rad, 20*log10(mag_dB), 'LineWidth', 1.5);
ylim([-20, 0]);  % Match y-axis limits: -20 dB to 0 dB
grid on;
title('Frequency Response (Graph B) - Magnitude');
xlabel('Frequency [rad/s]');
ylabel('Magnitude Response [dB]');

% Plot phase response
subplot(2,1,2);
semilogx(freq_rad, phase_deg, 'LineWidth', 1.5);
ylim([-80, 60]);  % Match y-axis limits: -80° to 60°
grid on;
title('Frequency Response (Graph B) - Phase');
xlabel('Frequency [rad/s]');
ylabel('Phase Response [deg]');