fs = 90/2;           % Sampling frequency in Hz (since ωs = 90π, fs = 90π/(2π) = 45 Hz)
Ts = 1/fs;           % Sampling period
n = 0:20;            % Sample indices (you can choose more samples if you like)

f1 = 30/(2);         % f1 = 30π/(2π) = 15 Hz
f2 = 60/(2);         % f2 = 60π/(2π) = 30 Hz
f3 = 90/(2);         % f3 = 90π/(2π) = 45 Hz

x1 = cos(2*pi*f1*n*Ts); % x1[n]
x2 = cos(2*pi*f2*n*Ts); % x2[n]
x3 = cos(2*pi*f3*n*Ts); % x3[n]

figure;
subplot(3,1,1); stem(n, x1); title('x1[n]');
grid on;
subplot(3,1,2); stem(n, x2); title('x2[n]');
grid on;
subplot(3,1,3); stem(n, x3); title('x3[n]');
grid on;

isequal(x1, x2)  % Should return true
isequal(x1, x3)  % Should return false
isequal(x2, x3)  % Should return false