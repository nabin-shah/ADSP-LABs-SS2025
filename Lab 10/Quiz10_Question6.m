% Parameters
fs = 500e3;              % Sampling frequency (Hz)
t = 0:1/fs:2e-3;         % Time vector (2 ms)
V0 = 1;                  % Amplitude of v0 (V)
Vc = 3;                  % Amplitude of vc (V)
f0 = 5e3;                % Frequency of v0 (Hz)
fc = 50e3;               % Frequency of vc (Hz)

% Input signals
v0 = V0 * cos(2*pi*f0*t);
vc = Vc * cos(2*pi*fc*t);
v1 = v0 + vc;

% Diode model: ideal half-wave rectifier
vout = max(v1, 0);

% (Optional) Simulate LC bandpass filter centered at fc
% For simplicity, use a bandpass filter (designfilt requires Signal Processing Toolbox)
% Uncomment if you have the toolbox:
% bpFilt = designfilt('bandpassiir','FilterOrder',4, ...
%     'HalfPowerFrequency1',fc-10e3,'HalfPowerFrequency2',fc+10e3, ...
%     'SampleRate',fs);
% vout_filt = filter(bpFilt, vout);

% FFT
N = length(vout);
f = fs*(0:(N/2))/N;
Y = fft(vout);
P = abs(Y/N);
P1 = P(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Plot time domain
figure;
subplot(2,1,1);
plot(t*1e3, vout);
title('Output v_{out}(t) (Time Domain)');
xlabel('Time (ms)'); ylabel('Amplitude (V)');

% Plot frequency domain
subplot(2,1,2);
plot(f/1e3, P1);
title('Output Spectrum (Frequency Domain)');
xlabel('Frequency (kHz)');
ylabel('Magnitude');
xlim([0 100]);
grid on;

% If you use the filtered version, plot that as well
% figure;
% plot(f/1e3, abs(fft(vout_filt)/N)(1:N/2+1));
% title('Filtered Output Spectrum');
% xlabel('Frequency (kHz)');
% ylabel('Magnitude');