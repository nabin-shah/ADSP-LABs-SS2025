% Circuit parameters
R = 100;
L = 1e-3;     % 10 microHenries
C = 0.01e-6;  % 0.01 microFarads

% % Define the transfer function for Vout = VL + VC in a series RLC
% num = [1];
% den = [L*C, R*C, 1];
% Define the transfer function for Vout = V_C + V_R in a series RLC
num = [R*C,1];
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

figure(1)
% Sinusoidal input at f_test
x_test = sin(2*pi*f_test*t);
lsim(sys, x_test, t);

title(['Response at f_0']);
xlabel('Time (s)');
ylabel('y1');
% legend('Input (Vin)', 'Output (Vout)');
grid on;
%------------------------------------------------------






%2. Frequency of interest (f0*100)
f_test2 = f0*100;
t2 = [0:0.01/f_test2:10/f_test2]; 

% Sinusoidal input at f_test
x_test2 = sin(2*pi*f_test2*t2);

 figure(2);
lsim(sys, x_test2, t2);
title(['Response at 100*f_0']);
xlabel('Time (s)');
ylabel('y1');
% legend('Input (Vin)', 'Output (Vout)');
grid on;
%---------------------------------------------------------






%3. Frequency of interest (f0/100)
f_test3 = f0/100;
t3 = [0:0.01/f_test3:10/f_test3]; 

% Sinusoidal input at f_test
x_test3 = sin(2*pi*f_test3*t3);

figure(3);
lsim(sys, x_test3, t3);
title(['Response at f_0/100']);
xlabel('Time (s)');
ylabel('y1');
% legend('Input (Vin)', 'Output (Vout)');
grid on;

%--------------------------------------------------------
