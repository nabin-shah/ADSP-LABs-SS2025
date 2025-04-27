fs = 100/2;       % Sampling frequency in Hz (since ωs = 100π, fs = 100π/(2π) = 50 Hz)
Ts = 1/fs;        % Sampling period
n = 0:20;         % Sample indices (feel free to use more or fewer)

f1 = 25/2;        % f1 = 25π / (2π) = 12.5 Hz
f2 = 50/2;        % f2 = 50π / (2π) = 25 Hz
f3 = 75/2;        % f3 = 75π / (2π) = 37.5 Hz

x1 = cos(2*pi*f1*n*Ts); % x1[n]
x2 = cos(2*pi*f2*n*Ts); % x2[n]
x3 = cos(2*pi*f3*n*Ts); % x3[n]

isequal(x1, x2)  % Should return false
isequal(x1, x3)  % Should return true
isequal(x2, x3)  % Should return false

figure;
subplot(3,1,1); stem(n, x1); title('x1[n]');
grid on;
subplot(3,1,2); stem(n, x2); title('x2[n]');
grid on;
subplot(3,1,3); stem(n, x3); title('x3[n]');
grid on;