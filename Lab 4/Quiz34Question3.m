% omega_s=100*pi;
omega_s=90*pi;
fs = omega_s/(2*pi);   % Sampling frequency (Hz)
T = 1/fs;              % Sampling period
t = 0:T:1-T;           % Time vector (1 second duration)
N = length(t);         % Number of samples

% x1 = cos(25 * pi * t); % 12.5 Hz signal (25π rad/s)
% x2 = cos(50 * pi * t); % 25 Hz signal (50π rad/s)
% x3 = cos(75 * pi * t); % 37.5 Hz signal (75π rad/s)

x1 = cos(30 * pi * t); % 12.5 Hz signal (25π rad/s)
x2 = cos(60 * pi * t); % 25 Hz signal (50π rad/s)
x3 = cos(90 * pi * t); % 37.5 Hz signal (75π rad/s)

% Compute FFT
f = (-N/2:N/2-1) * fs/N; % Frequency axis

X1 = fftshift(fft(x1));  % FFT of x1(t)
X2 = fftshift(fft(x2));  % FFT of x2(t)
X3 = fftshift(fft(x3));  % FFT of x3(t)

% Normalize magnitudes
X1_mag = abs(X1)/N;
X2_mag = abs(X2)/N;
X3_mag = abs(X3)/N;

figure;

subplot(3,1,1);
stem(f, X1_mag);
% title('FFT of x_1(t) = cos(25πt)');
title('FFT of x_1(t) = cos(30πt)');
xlabel('Frequency (Hz)');
xlim([-fs/2, fs/2]);
grid on;

subplot(3,1,2);
stem(f, X2_mag);
% title('FFT of x_2(t) = cos(50πt)');
title('FFT of x_2(t) = cos(60πt)');
xlabel('Frequency (Hz)');
xlim([-fs/2, fs/2]);
grid on;

subplot(3,1,3);
stem(f, X3_mag);
% title('FFT of x_3(t) = cos(75πt)');
title('FFT of x_3(t) = cos(90πt)');
xlabel('Frequency (Hz)');
xlim([-fs/2, fs/2]);
grid on;