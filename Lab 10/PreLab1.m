% Parameters
fs = 1e5;           % Sampling frequency (Hz)
t = 0:1/fs:0.01;    % Time vector (10 ms)
f0 = 1e3;           % Modulating frequency (Hz)
fc = 10e3;          % Carrier frequency (Hz)

% Input signals
v0 = cos(2*pi*f0*t);
vc = cos(2*pi*fc*t);

% Single-diode mixer output (before BPF)
y_single = v0 .* vc;

% Diode-ring mixer output (before BPF)
y_ring = v0 .* sign(vc);

% Plot
figure;
subplot(2,1,1);
plot(t, y_single);
title('Single-Diode Mixer Output (before BPF)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(2,1,2);
plot(t, y_ring);
title('Diode-Ring Mixer Output (before BPF)');
xlabel('Time (s)'); ylabel('Amplitude');