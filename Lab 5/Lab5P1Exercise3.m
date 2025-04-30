% Define component values (same as before)
R = 100;
L = 1e-3;
C = 10e-9;

% Define state-space matrices
A = [-R/L, -1/L; 1/C, 0];
B = [1/L; 0];
C_out = [-R, 0];  % Note: Using C_out to avoid confusion with C (capacitance)
D = 1;

% Create state-space system
sys_ss = ss(A, B, C_out, D);

% Plot frequency response (Bode plot)
bode(sys_ss);
grid on;
title('Frequency Response of RLC Circuit (vout = vL + vC)');

figure;
%generate pole-zero plot 
pzmap(sys_ss);
grid on;
title('Pole-zero Plot of RLC circuit')