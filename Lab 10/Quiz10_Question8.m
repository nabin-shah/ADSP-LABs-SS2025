% Parameters
fs = 500e3;              % Sampling frequency (Hz)
t = 0:1/fs:2e-3;         % Time vector (2 ms)
V0 = 1;                  % Amplitude of v0 (V)
Vc = 3;                  % Amplitude of vc (V)
f0 = 5e3;                % Frequency of v0 (Hz)
fc = 50e3;               % Frequency of vc (Hz)

% Input signals WITHOUT DC offsets
v0_noDC = V0 * cos(2*pi*f0*t);
vc_noDC = Vc * cos(2*pi*fc*t);
v1_noDC = v0_noDC + vc_noDC;
vout_noDC = max(v1_noDC, 0);

% Input signals WITH DC offsets
dc0 = 1;                 % DC offset for v0 (V)
dcc = 0.5;               % DC offset for vc (V)
v0_DC = V0 * cos(2*pi*f0*t) + dc0;
vc_DC = Vc * cos(2*pi*fc*t) + dcc;
v1_DC = v0_DC + vc_DC;
vout_DC = max(v1_DC, 0);

% FFT
N = length(t);
f = fs*(0:(N/2))/N;

Y_noDC = fft(vout_noDC);
P_noDC = abs(Y_noDC/N);
P1_noDC = P_noDC(1:N/2+1);
P1_noDC(2:end-1) = 2*P1_noDC(2:end-1);

Y_DC = fft(vout_DC);
P_DC = abs(Y_DC/N);
P1_DC = P_DC(1:N/2+1);
P1_DC(2:end-1) = 2*P1_DC(2:end-1);

% Plot spectra
figure;
plot(f/1e3, P1_noDC, 'b', 'LineWidth', 1.5); hold on;
plot(f/1e3, P1_DC, 'r--', 'LineWidth', 1.5);
title('Spectrum of v_{out}(t) with and without DC Offsets');
xlabel('Frequency (kHz)');
ylabel('Magnitude');
legend('No DC offsets', 'With DC offsets');
xlim([0 100]);
grid on;