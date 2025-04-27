% --- Parameters ---
f0 = 100;         % Frequency of the continuous-time signal (Hz)
phi = pi/4;       % Phase of the signal
N = 1024;         % Number of samples (FFT points - power of 2 is efficient)
n = 0:N-1;        % Discrete time indices

% --- Case 1: fs = 1000 Hz (1 kHz) ---
fs1 = 1000;       % Sampling frequency (Hz)
Ts1 = 1/fs1;      % Sampling period

% Generate DT signal
xn1 = cos(2*pi*f0 * n * Ts1 + phi); % or xn1 = cos(2*pi*(f0/fs1)*n + phi);

% Compute FFT and shift zero frequency to center
Xk1 = fft(xn1);
Xk1_shifted = fftshift(Xk1);

% Create normalized frequency axis [-pi, pi]
Omega1 = (-N/2 : N/2-1) * (2*pi / N);

% Theoretical calculation (for comparison)
w0_1 = 2*pi * (f0/fs1);
disp(['Case 1 (fs = 1000 Hz): Theoretical omega_0 = ', num2str(w0_1/pi), '*pi']);
disp(['Expected peaks (normalized) at +/- ', num2str(w0_1/pi)]); % Should be +/- 0.2

% Plot the spectrum
figure;
plot(Omega1/pi, abs(Xk1_shifted)/N); % Normalize magnitude for amplitude
grid on;
xlabel('\Omega / \pi');
ylabel('Magnitude |X(e^{j\Omega})|');
title('DT Spectrum for fs = 1000 Hz');
xlim([-1, 1]); % Limit x-axis to [-pi, pi]
ylim([0, max(abs(Xk1_shifted)/N) * 1.1 + eps]); % Adjust y-axis, add eps for zero case

% --- Case 2: fs = 100 Hz ---
fs2 = 100;        % Sampling frequency (Hz)
Ts2 = 1/fs2;      % Sampling period

% Generate DT signal
xn2 = cos(2*pi*f0 * n * Ts2 + phi); % or xn2 = cos(2*pi*(f0/fs2)*n + phi);

% Compute FFT and shift
Xk2 = fft(xn2);
Xk2_shifted = fftshift(Xk2);

% Frequency axis (same as Omega1, reusing variable for clarity in plot)
Omega2 = Omega1;

% Theoretical calculation (for comparison)
w0_2 = 2*pi * (f0/fs2);
% Find alias in [-pi, pi]
Omega_alias_pos = mod(w0_2 + pi, 2*pi) - pi; % Alias for +w0_2
Omega_alias_neg = mod(-w0_2 + pi, 2*pi) - pi;% Alias for -w0_2
disp(' ');
disp(['Case 2 (fs = 100 Hz): Theoretical omega_0 = ', num2str(w0_2/pi), '*pi']);
disp(['Aliases in [-pi, pi] are at: ', num2str(Omega_alias_pos/pi), '*pi and ', num2str(Omega_alias_neg/pi), '*pi']);
disp(['Expected single peak (normalized) at ', num2str(Omega_alias_pos/pi)]); % Should be 0

% Plot the spectrum
figure;
plot(Omega2/pi, abs(Xk2_shifted)/N);
grid on;
xlabel('\Omega / \pi');
ylabel('Magnitude |X(e^{j\Omega})|');
title('DT Spectrum for fs = 100 Hz');
xlim([-1, 1]);
ylim([0, max(abs(Xk2_shifted)/N) * 1.1 + eps]);

% --- Case 3: fs = 80 Hz ---
fs3 = 80;         % Sampling frequency (Hz)
Ts3 = 1/fs3;      % Sampling period

% Generate DT signal
xn3 = cos(2*pi*f0 * n * Ts3 + phi); % or xn3 = cos(2*pi*(f0/fs3)*n + phi);

% Compute FFT and shift
Xk3 = fft(xn3);
Xk3_shifted = fftshift(Xk3);

% Frequency axis (same as Omega1)
Omega3 = Omega1;

% Theoretical calculation (for comparison)
w0_3 = 2*pi * (f0/fs3);
% Find alias in [-pi, pi]
Omega_alias_pos_3 = mod(w0_3 + pi, 2*pi) - pi;  % Alias for +w0_3
Omega_alias_neg_3 = mod(-w0_3 + pi, 2*pi) - pi; % Alias for -w0_3
disp(' ');
disp(['Case 3 (fs = 80 Hz): Theoretical omega_0 = ', num2str(w0_3/pi), '*pi']);
disp(['Aliases in [-pi, pi] are at: ', num2str(Omega_alias_pos_3/pi), '*pi and ', num2str(Omega_alias_neg_3/pi), '*pi']);
disp(['Expected peaks (normalized) at +/- ', num2str(abs(Omega_alias_pos_3/pi))]); % Should be +/- 0.5

% Plot the spectrum
figure;
plot(Omega3/pi, abs(Xk3_shifted)/N);
grid on;
xlabel('\Omega / \pi');
ylabel('Magnitude |X(e^{j\Omega})|');
title('DT Spectrum for fs = 80 Hz');
xlim([-1, 1]);
ylim([0, max(abs(Xk3_shifted)/N) * 1.1 + eps]);