% Parameters
fs = 100e3;              % Sampling frequency (Hz)
t = 0:1/fs:2e-3;         % Time vector (2 ms)
V0 = 1.5;                % Amplitude of v0 (V)
Vc = 3;                  % Amplitude of vc (V)
f0 = 1e3;                % Frequency of v0 (Hz)
fc = 10e3;               % Frequency of vc (Hz)
dc0 = 1;                 % DC offset for v0 (V)
dcc = 0.5;               % DC offset for vc (V)

% Input signals with DC offsets
v0 = V0 * cos(2*pi*f0*t) + dc0;
vc = Vc * cos(2*pi*fc*t) + dcc;
v1 = v0 + vc;

% Diode model: ideal half-wave rectifier (output = v1 if v1 > 0, else 0)
vout = max(v1, 0);

% Plot
figure;
subplot(3,1,1);
plot(t*1e3, v0);
title('v_0(t) = 1.5 cos(2\pi 1kHz t) + 1');
xlabel('Time (ms)'); ylabel('Amplitude (V)');

subplot(3,1,2);
plot(t*1e3, vc);
title('v_c(t) = 3 cos(2\pi 10kHz t) + 0.5');
xlabel('Time (ms)'); ylabel('Amplitude (V)');

subplot(3,1,3);
plot(t*1e3, vout);
title('v_{out}(t) = max(v_0(t) + v_c(t), 0) (Diode Output with DC Offsets)');
xlabel('Time (ms)'); ylabel('Amplitude (V)');

sgtitle('Mixer Output with Diode and DC Offsets');