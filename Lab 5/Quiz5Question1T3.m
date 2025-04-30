% Circuit parameters
R = 100;
L = 1e-3;     % 10 microHenries
C = 0.1e-6;  % 0.01 microFarads

% Define the transfer function for Vout = VL + VC in a series RLC
num = [L*C, 0, 1];
den = [L*C, R*C, 1];

% Transfer function model
sys = tf(num, den);

% Resonant frequency
f0 = 1/(2*pi*sqrt(L*C));
disp(['Resonant Frequency (f0): ', num2str(f0/1e3), ' kHz']);
%------------------------------------------------------
% Frequency of interest (f0)
f_test = f0;
t = [0:0.01/f_test:10/f_test]; 

% Sinusoidal input at f_test
x_test = sin(2*pi*f_test*t);
y_test = lsim(sys, x_test, t);

% Plot input and output  f0
figure;
plot(t, x_test, t, y_test);
title(['Response at f0']);
xlabel('Time (s)');
ylabel('y1');
legend('Input (Vin)', 'Output (Vout)');
grid on;
%------------------------------------------------------

% Frequency of interest (f0*10)
f_test2 = f0*5;
t2 = [0:0.01/f_test2:10/f_test2]; 

% Sinusoidal input at f_test
x_test2 = sin(2*pi*f_test2*t2);
y_test2 = lsim(sys, x_test2, t2);

% Plot input and output  f0*10
figure;
plot(t2, x_test2, t2, y_test2);
% title(['Response at f0*10 = ', num2str(f_test/1e3), ' kHz']);
title(['Response at 5*f0']);
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Input (Vin)', 'Output (Vout)');
grid on;
%---------------------------------------------------------

% Frequency of interest (f0/10)
f_test3 = f0/5;
t3 = [0:0.01/f_test3:10/f_test3]; 

% Sinusoidal input at f_test
x_test3 = sin(2*pi*f_test3*t3);
y_test3 = lsim(sys, x_test3, t3);

% Plot input and output  f0/10
figure;
plot(t3, x_test3, t3, y_test3);
% title(['Response at f0/10 = ', num2str(f_test/1e3), ' kHz']);
title(['Response at f0/5']);
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Input (Vin)', 'Output (Vout)');
grid on;

%--------------------------------------------------------
