% Parameters
Omega0 = pi/4;  % Zero/pole angle (π/4)
r = 0.95;       % Pole radius

% Numerator and denominator coefficients
B = [1, -2*cos(Omega0), 1];         % Numerator: 1 - 2cos(Ω0)z⁻¹ + z⁻²
A = [1, -2*r*cos(Omega0), r^2];     % Denominator: 1 - 2rcos(Ω0)z⁻¹ + r²z⁻²

% Frequency response
w = linspace(0, pi, 1000);          % Digital frequencies (0 to π)
H = freqz(B, A, w);                 % Compute frequency response
mag = abs(H);                       % Magnitude
mag_dB = 20*log10(mag);             % Convert to dB

% Plot
figure;
plot(w, mag_dB, 'b', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude (dB)');
title('Magnitude Response of IIR Parametric Equalizer');
grid on;
xline(Omega0, 'r--', 'Ω₀ = π/4', 'LabelVerticalAlignment', 'bottom');
ylim([-30, 10]); % Adjust based on response